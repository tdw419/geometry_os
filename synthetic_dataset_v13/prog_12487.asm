; DESCRIPTION: Draws a blue line from (329, 116) to (172, 88).
; PLAN: r0=329(x1), r1=116(y1), r2=172(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 116
LDI r2, 172
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
