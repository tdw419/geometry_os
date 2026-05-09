; DESCRIPTION: Composite: Places a magenta dot at position (448, 135) then Places a red 100x54 rectangle at position (407, 187) then Draws a orange circle centered at (440, 100) with radius 46.
; PLAN: r0=448(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=187(y), r7=100(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x), r11=100(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 187
LDI r7, 100
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 100
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
