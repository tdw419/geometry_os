; DESCRIPTION: Draws a blue line from (331, 128) to (262, 233).
; PLAN: r0=331(x1), r1=128(y1), r2=262(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 128
LDI r2, 262
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
