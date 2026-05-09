; DESCRIPTION: Composite: Places a magenta dot at position (200, 250) then Places a yellow line segment connecting (19, 198) to (322, 211) then Draws a white rectangle at (110, 64) with width 66 and height 68.
; PLAN: r0=200(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=198(y1), r7=322(x2), r8=211(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=110(x), r11=64(y), r12=66(width), r13=68(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 250
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 198
LDI r7, 322
LDI r8, 211
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 64
LDI r12, 66
LDI r13, 68
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
