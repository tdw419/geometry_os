; DESCRIPTION: Draws a blue line from (493, 193) to (325, 223).
; PLAN: r0=493(x1), r1=193(y1), r2=325(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 193
LDI r2, 325
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
