; DESCRIPTION: Renders a green line between points (450, 189) and (400, 131).
; PLAN: r0=450(x1), r1=189(y1), r2=400(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 189
LDI r2, 400
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
