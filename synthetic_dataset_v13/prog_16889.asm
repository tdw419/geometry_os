; DESCRIPTION: Renders a yellow line between points (292, 75) and (466, 132).
; PLAN: r0=292(x1), r1=75(y1), r2=466(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 75
LDI r2, 466
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
