; DESCRIPTION: Composite: Creates a red rectangular region at (418, 167) spanning 63 by 85 pixels then Sets a single yellow pixel at (86, 129) then Places a blue line segment connecting (39, 90) to (100, 136).
; PLAN: r0=418(x), r1=167(y), r2=63(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=129(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=39(x1), r11=90(y1), r12=100(x2), r13=136(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 167
LDI r2, 63
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 129
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 39
LDI r11, 90
LDI r12, 100
LDI r13, 136
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
