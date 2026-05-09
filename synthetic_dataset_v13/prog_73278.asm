; DESCRIPTION: Renders a magenta line between points (31, 185) and (463, 33).
; PLAN: r0=31(x1), r1=185(y1), r2=463(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 185
LDI r2, 463
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
