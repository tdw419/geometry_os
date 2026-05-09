; DESCRIPTION: Renders a white line between points (377, 168) and (80, 107).
; PLAN: r0=377(x1), r1=168(y1), r2=80(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 168
LDI r2, 80
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
