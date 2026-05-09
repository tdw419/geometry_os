; DESCRIPTION: Composite: Places a white dot at position (386, 232) then Renders a orange line between points (360, 105) and (202, 216).
; PLAN: r0=386(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=360(x1), r6=105(y1), r7=202(x2), r8=216(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 105
LDI r7, 202
LDI r8, 216
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
