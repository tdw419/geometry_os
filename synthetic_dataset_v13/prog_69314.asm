; DESCRIPTION: Renders a green line between points (317, 243) and (131, 35).
; PLAN: r0=317(x1), r1=243(y1), r2=131(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 243
LDI r2, 131
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
