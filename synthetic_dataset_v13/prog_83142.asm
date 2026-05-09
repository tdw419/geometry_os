; DESCRIPTION: Composite: Sets a single orange pixel at (76, 232) then Draws a white line from (448, 9) to (473, 185) then Places a orange 87x25 rectangle at position (189, 185).
; PLAN: r0=76(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=9(y1), r7=473(x2), r8=185(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=185(y), r12=87(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 448
LDI r6, 9
LDI r7, 473
LDI r8, 185
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 185
LDI r12, 87
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
