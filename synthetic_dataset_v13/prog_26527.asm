; DESCRIPTION: Renders a magenta line between points (416, 163) and (317, 233).
; PLAN: r0=416(x1), r1=163(y1), r2=317(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 163
LDI r2, 317
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
