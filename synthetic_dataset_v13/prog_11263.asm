; DESCRIPTION: Renders a magenta line between points (429, 8) and (271, 121).
; PLAN: r0=429(x1), r1=8(y1), r2=271(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 8
LDI r2, 271
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
