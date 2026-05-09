; DESCRIPTION: Composite: Places a orange dot at position (178, 70) then Renders a orange line between points (149, 188) and (341, 216).
; PLAN: r0=178(x), r1=70(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=188(y1), r7=341(x2), r8=216(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 70
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 149
LDI r6, 188
LDI r7, 341
LDI r8, 216
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
