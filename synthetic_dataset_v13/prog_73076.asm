; DESCRIPTION: Draws a purple line from (64, 121) to (367, 123).
; PLAN: r0=64(x1), r1=121(y1), r2=367(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 121
LDI r2, 367
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
