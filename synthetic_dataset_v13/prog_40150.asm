; DESCRIPTION: Places a orange line segment connecting (358, 206) to (279, 250).
; PLAN: r0=358(x1), r1=206(y1), r2=279(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 206
LDI r2, 279
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
