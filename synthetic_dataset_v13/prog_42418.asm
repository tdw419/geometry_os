; DESCRIPTION: Composite: Renders a black disk with center (467, 32) and radius 26 then Draws a orange line from (94, 113) to (511, 56).
; PLAN: r0=467(x), r1=32(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x1), r6=113(y1), r7=511(x2), r8=56(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 32
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 113
LDI r7, 511
LDI r8, 56
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
