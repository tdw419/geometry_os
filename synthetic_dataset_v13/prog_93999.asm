; DESCRIPTION: Composite: Renders a orange line between points (247, 252) and (351, 228) then Renders a orange disk with center (367, 66) and radius 30.
; PLAN: r0=247(x1), r1=252(y1), r2=351(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=66(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 252
LDI r2, 351
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 66
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
