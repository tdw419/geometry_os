; DESCRIPTION: Composite: Places a orange line segment connecting (454, 78) to (354, 205) then Creates a magenta rectangular region at (262, 118) spanning 31 by 12 pixels then Places a purple dot at position (409, 218).
; PLAN: r0=454(x1), r1=78(y1), r2=354(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=118(y), r7=31(width), r8=12(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=218(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 454
LDI r1, 78
LDI r2, 354
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 118
LDI r7, 31
LDI r8, 12
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 218
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
