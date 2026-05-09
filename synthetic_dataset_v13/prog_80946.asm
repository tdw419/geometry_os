; DESCRIPTION: Renders a white line between points (159, 185) and (387, 176).
; PLAN: r0=159(x1), r1=185(y1), r2=387(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 185
LDI r2, 387
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
