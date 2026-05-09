; DESCRIPTION: Composite: Places a orange dot at position (33, 108) then Renders a purple line between points (52, 98) and (440, 116).
; PLAN: r0=33(x), r1=108(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=98(y1), r7=440(x2), r8=116(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 108
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 52
LDI r6, 98
LDI r7, 440
LDI r8, 116
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
