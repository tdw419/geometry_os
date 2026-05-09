; DESCRIPTION: Composite: Renders a green line between points (13, 82) and (46, 237) then Creates a white circular shape at (399, 97) with radius 78.
; PLAN: r0=13(x1), r1=82(y1), r2=46(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=97(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 82
LDI r2, 46
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 97
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
