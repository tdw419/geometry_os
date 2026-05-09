; DESCRIPTION: Composite: Places a blue line segment connecting (1, 237) to (227, 13) then Creates a magenta rectangular region at (391, 208) spanning 74 by 16 pixels then Places a yellow dot at position (213, 17).
; PLAN: r0=1(x1), r1=237(y1), r2=227(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=208(y), r7=74(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=17(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 237
LDI r2, 227
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 208
LDI r7, 74
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 17
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
