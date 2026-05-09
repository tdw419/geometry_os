; DESCRIPTION: Places a magenta line segment connecting (434, 120) to (105, 227).
; PLAN: r0=434(x1), r1=120(y1), r2=105(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 120
LDI r2, 105
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
