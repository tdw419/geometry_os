; DESCRIPTION: Renders a green line between points (393, 142) and (317, 203).
; PLAN: r0=393(x1), r1=142(y1), r2=317(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 142
LDI r2, 317
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
