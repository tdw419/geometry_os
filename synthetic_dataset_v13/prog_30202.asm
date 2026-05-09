; DESCRIPTION: Renders a green line between points (317, 105) and (419, 75).
; PLAN: r0=317(x1), r1=105(y1), r2=419(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 105
LDI r2, 419
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
