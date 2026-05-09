; DESCRIPTION: Renders a yellow line between points (80, 48) and (317, 75).
; PLAN: r0=80(x1), r1=48(y1), r2=317(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 48
LDI r2, 317
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
