; DESCRIPTION: Draws a purple line from (325, 209) to (2, 239).
; PLAN: r0=325(x1), r1=209(y1), r2=2(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 209
LDI r2, 2
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
