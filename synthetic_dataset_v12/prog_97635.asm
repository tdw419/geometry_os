; DESCRIPTION: Composite: Sets a single purple pixel at (69, 32) then Places a red line segment connecting (52, 5) to (250, 113) then Draws a white rectangle at (332, 217) with width 80 and height 18.
; PLAN: r0=69(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=5(y1), r7=250(x2), r8=113(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=217(y), r12=80(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 5
LDI r7, 250
LDI r8, 113
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 217
LDI r12, 80
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
