; DESCRIPTION: Composite: Draws a green line from (419, 47) to (448, 105) then Places a orange dot at position (470, 57) then Renders a black box of size 11x71 starting at (282, 126).
; PLAN: r0=419(x1), r1=47(y1), r2=448(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=57(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=126(y), r12=11(width), r13=71(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 47
LDI r2, 448
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 57
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 282
LDI r11, 126
LDI r12, 11
LDI r13, 71
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
