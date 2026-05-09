; DESCRIPTION: Composite: Places a orange dot at position (440, 40) then Renders a purple line between points (31, 148) and (360, 206).
; PLAN: r0=440(x), r1=40(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=31(x1), r6=148(y1), r7=360(x2), r8=206(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 40
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 31
LDI r6, 148
LDI r7, 360
LDI r8, 206
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
