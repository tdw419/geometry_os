; DESCRIPTION: Draws a purple line from (312, 29) to (193, 128).
; PLAN: r0=312(x1), r1=29(y1), r2=193(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 29
LDI r2, 193
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
