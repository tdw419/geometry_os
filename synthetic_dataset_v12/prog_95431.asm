; DESCRIPTION: Renders a magenta line between points (249, 186) and (325, 142).
; PLAN: r0=249(x1), r1=186(y1), r2=325(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 186
LDI r2, 325
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
