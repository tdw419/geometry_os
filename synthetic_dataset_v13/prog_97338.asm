; DESCRIPTION: Composite: Renders a white disk with center (289, 41) and radius 30 then Renders a orange line between points (261, 87) and (504, 68).
; PLAN: r0=289(x), r1=41(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=87(y1), r7=504(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 41
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 87
LDI r7, 504
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
