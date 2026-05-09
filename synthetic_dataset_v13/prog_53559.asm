; DESCRIPTION: Places a yellow line segment connecting (185, 135) to (358, 68).
; PLAN: r0=185(x1), r1=135(y1), r2=358(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 135
LDI r2, 358
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
