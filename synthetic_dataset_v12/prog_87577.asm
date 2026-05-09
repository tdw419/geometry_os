; DESCRIPTION: Draws a blue line from (319, 16) to (325, 214).
; PLAN: r0=319(x1), r1=16(y1), r2=325(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 16
LDI r2, 325
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
