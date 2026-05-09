; DESCRIPTION: Draws a orange line from (288, 44) to (72, 96).
; PLAN: r0=288(x1), r1=44(y1), r2=72(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 44
LDI r2, 72
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
