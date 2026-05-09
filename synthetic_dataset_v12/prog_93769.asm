; DESCRIPTION: Renders a green line between points (419, 138) and (138, 3).
; PLAN: r0=419(x1), r1=138(y1), r2=138(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 138
LDI r2, 138
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
