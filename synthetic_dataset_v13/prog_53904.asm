; DESCRIPTION: Draws a blue line from (459, 5) to (408, 157).
; PLAN: r0=459(x1), r1=5(y1), r2=408(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 5
LDI r2, 408
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
