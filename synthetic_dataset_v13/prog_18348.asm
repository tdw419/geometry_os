; DESCRIPTION: Composite: Places a white line segment connecting (157, 29) to (217, 139) then Places a orange dot at position (126, 9).
; PLAN: r0=157(x1), r1=29(y1), r2=217(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=9(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 157
LDI r1, 29
LDI r2, 217
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 9
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
