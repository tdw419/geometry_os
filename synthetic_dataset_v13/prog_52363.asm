; DESCRIPTION: Renders a magenta line between points (331, 215) and (463, 122).
; PLAN: r0=331(x1), r1=215(y1), r2=463(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 215
LDI r2, 463
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
