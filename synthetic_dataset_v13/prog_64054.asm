; DESCRIPTION: Draws a blue line from (361, 196) to (312, 65).
; PLAN: r0=361(x1), r1=196(y1), r2=312(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 196
LDI r2, 312
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
