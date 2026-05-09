; DESCRIPTION: Composite: Sets a single black pixel at (150, 183) then Renders a purple line between points (448, 56) and (56, 124) then Places a orange 80x23 rectangle at position (274, 43).
; PLAN: r0=150(x), r1=183(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=56(y1), r7=56(x2), r8=124(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=43(y), r12=80(width), r13=23(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 183
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 448
LDI r6, 56
LDI r7, 56
LDI r8, 124
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 43
LDI r12, 80
LDI r13, 23
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
