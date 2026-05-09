; DESCRIPTION: Renders a magenta line between points (3, 105) and (198, 6).
; PLAN: r0=3(x1), r1=105(y1), r2=198(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 105
LDI r2, 198
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
