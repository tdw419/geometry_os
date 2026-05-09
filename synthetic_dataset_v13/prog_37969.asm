; DESCRIPTION: Composite: Places a green line segment connecting (73, 30) to (266, 161) then Sets a single blue pixel at (79, 24) then Draws a orange rectangle at (233, 135) with width 101 and height 60.
; PLAN: r0=73(x1), r1=30(y1), r2=266(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=24(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=233(x), r11=135(y), r12=101(width), r13=60(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 30
LDI r2, 266
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 24
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 135
LDI r12, 101
LDI r13, 60
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
