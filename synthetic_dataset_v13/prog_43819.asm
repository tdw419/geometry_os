; DESCRIPTION: Renders a magenta line between points (464, 133) and (66, 105).
; PLAN: r0=464(x1), r1=133(y1), r2=66(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 133
LDI r2, 66
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
