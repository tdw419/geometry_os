; DESCRIPTION: Draws a white line from (397, 222) to (448, 22).
; PLAN: r0=397(x1), r1=222(y1), r2=448(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 222
LDI r2, 448
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
