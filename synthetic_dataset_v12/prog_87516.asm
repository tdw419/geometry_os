; DESCRIPTION: Renders a green line between points (52, 37) and (317, 109).
; PLAN: r0=52(x1), r1=37(y1), r2=317(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 37
LDI r2, 317
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
