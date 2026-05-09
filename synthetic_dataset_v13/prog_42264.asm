; DESCRIPTION: Renders a white line between points (201, 163) and (324, 127).
; PLAN: r0=201(x1), r1=163(y1), r2=324(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 163
LDI r2, 324
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
