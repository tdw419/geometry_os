; DESCRIPTION: Renders a magenta line between points (260, 29) and (5, 161).
; PLAN: r0=260(x1), r1=29(y1), r2=5(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 29
LDI r2, 5
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
