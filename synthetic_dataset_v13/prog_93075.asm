; DESCRIPTION: Renders a magenta line between points (334, 204) and (452, 212).
; PLAN: r0=334(x1), r1=204(y1), r2=452(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 204
LDI r2, 452
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
