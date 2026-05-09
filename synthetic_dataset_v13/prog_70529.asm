; DESCRIPTION: Composite: Places a purple dot at position (205, 250) then Renders a yellow line between points (352, 5) and (417, 22) then Creates a orange rectangular region at (179, 28) spanning 74 by 79 pixels.
; PLAN: r0=205(x), r1=250(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=352(x1), r6=5(y1), r7=417(x2), r8=22(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=28(y), r12=74(width), r13=79(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 250
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 5
LDI r7, 417
LDI r8, 22
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 28
LDI r12, 74
LDI r13, 79
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
