; DESCRIPTION: Renders a yellow line between points (367, 26) and (419, 75).
; PLAN: r0=367(x1), r1=26(y1), r2=419(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 26
LDI r2, 419
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
