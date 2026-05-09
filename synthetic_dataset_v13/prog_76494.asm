; DESCRIPTION: Renders a magenta line between points (223, 162) and (388, 176).
; PLAN: r0=223(x1), r1=162(y1), r2=388(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 162
LDI r2, 388
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
