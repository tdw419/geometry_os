; DESCRIPTION: Renders a white line between points (345, 251) and (413, 238).
; PLAN: r0=345(x1), r1=251(y1), r2=413(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 251
LDI r2, 413
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
