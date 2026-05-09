; DESCRIPTION: Composite: Places a orange dot at position (9, 230) then Places a magenta line segment connecting (48, 77) to (343, 172) then Places a blue 111x82 rectangle at position (390, 3).
; PLAN: r0=9(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=48(x1), r6=77(y1), r7=343(x2), r8=172(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=3(y), r12=111(width), r13=82(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 48
LDI r6, 77
LDI r7, 343
LDI r8, 172
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 3
LDI r12, 111
LDI r13, 82
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
