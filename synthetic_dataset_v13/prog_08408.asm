; DESCRIPTION: Renders a green line between points (101, 5) and (419, 65).
; PLAN: r0=101(x1), r1=5(y1), r2=419(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 5
LDI r2, 419
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
