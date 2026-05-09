; DESCRIPTION: Draws a blue line from (150, 63) to (331, 73).
; PLAN: r0=150(x1), r1=63(y1), r2=331(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 63
LDI r2, 331
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
