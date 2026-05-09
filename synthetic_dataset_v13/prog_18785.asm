; DESCRIPTION: Composite: Renders a orange line between points (89, 207) and (274, 93) then Creates a cyan circular shape at (239, 176) with radius 56.
; PLAN: r0=89(x1), r1=207(y1), r2=274(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=176(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 207
LDI r2, 274
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 176
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
