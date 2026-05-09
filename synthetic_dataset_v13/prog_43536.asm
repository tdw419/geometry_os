; DESCRIPTION: Places a magenta line segment connecting (249, 47) to (463, 180).
; PLAN: r0=249(x1), r1=47(y1), r2=463(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 47
LDI r2, 463
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
