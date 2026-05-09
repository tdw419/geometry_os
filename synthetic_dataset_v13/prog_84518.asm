; DESCRIPTION: Draws a blue line from (433, 128) to (3, 251).
; PLAN: r0=433(x1), r1=128(y1), r2=3(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 128
LDI r2, 3
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
