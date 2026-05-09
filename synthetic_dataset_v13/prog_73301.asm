; DESCRIPTION: Renders a magenta line between points (332, 133) and (50, 15).
; PLAN: r0=332(x1), r1=133(y1), r2=50(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 133
LDI r2, 50
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
