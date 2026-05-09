; DESCRIPTION: Composite: Sets a single white pixel at (236, 33) then Draws a purple line from (283, 32) to (399, 110) then Draws a blue rectangle at (363, 14) with width 53 and height 19.
; PLAN: r0=236(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=32(y1), r7=399(x2), r8=110(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=14(y), r12=53(width), r13=19(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 32
LDI r7, 399
LDI r8, 110
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 14
LDI r12, 53
LDI r13, 19
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
