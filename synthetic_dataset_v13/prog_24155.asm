; DESCRIPTION: Composite: Creates a blue rectangular region at (101, 89) spanning 22 by 70 pixels then Sets a single yellow pixel at (19, 153) then Places a red circle of radius 66 at center (215, 167).
; PLAN: r0=101(x), r1=89(y), r2=22(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=153(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=167(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 101
LDI r1, 89
LDI r2, 22
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 153
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 215
LDI r11, 167
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
