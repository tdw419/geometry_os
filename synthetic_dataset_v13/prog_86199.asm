; DESCRIPTION: Renders a magenta line between points (95, 206) and (448, 204).
; PLAN: r0=95(x1), r1=206(y1), r2=448(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 206
LDI r2, 448
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
