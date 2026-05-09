; DESCRIPTION: Renders a magenta line between points (429, 207) and (194, 198).
; PLAN: r0=429(x1), r1=207(y1), r2=194(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 207
LDI r2, 194
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
