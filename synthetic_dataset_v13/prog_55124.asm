; DESCRIPTION: Draws a white line from (105, 56) to (366, 1).
; PLAN: r0=105(x1), r1=56(y1), r2=366(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 56
LDI r2, 366
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
