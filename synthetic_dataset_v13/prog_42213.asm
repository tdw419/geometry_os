; DESCRIPTION: Composite: Creates a cyan circular shape at (471, 95) with radius 13 then Renders a yellow line between points (87, 2) and (273, 203).
; PLAN: r0=471(x), r1=95(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=2(y1), r7=273(x2), r8=203(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 95
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 2
LDI r7, 273
LDI r8, 203
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
