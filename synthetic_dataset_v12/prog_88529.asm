; DESCRIPTION: Renders a magenta line between points (422, 133) and (457, 183).
; PLAN: r0=422(x1), r1=133(y1), r2=457(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 133
LDI r2, 457
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
