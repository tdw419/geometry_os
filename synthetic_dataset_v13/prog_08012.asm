; DESCRIPTION: Composite: Renders a red line between points (454, 129) and (429, 185) then Places a white dot at position (448, 218).
; PLAN: r0=454(x1), r1=129(y1), r2=429(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=218(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 129
LDI r2, 429
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 218
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
