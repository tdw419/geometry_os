; DESCRIPTION: Draws a green line from (195, 88) to (132, 116).
; PLAN: r0=195(x1), r1=88(y1), r2=132(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 88
LDI r2, 132
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
