; DESCRIPTION: Draws a blue line from (440, 21) to (312, 30).
; PLAN: r0=440(x1), r1=21(y1), r2=312(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 21
LDI r2, 312
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
