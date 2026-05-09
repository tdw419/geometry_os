; DESCRIPTION: Draws a magenta line from (61, 88) to (310, 218).
; PLAN: r0=61(x1), r1=88(y1), r2=310(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 88
LDI r2, 310
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
