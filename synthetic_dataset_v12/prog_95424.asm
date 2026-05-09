; DESCRIPTION: Renders a magenta line between points (450, 254) and (149, 189).
; PLAN: r0=450(x1), r1=254(y1), r2=149(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 254
LDI r2, 149
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
