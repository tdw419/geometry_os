; DESCRIPTION: Draws a blue line from (407, 131) to (499, 86).
; PLAN: r0=407(x1), r1=131(y1), r2=499(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 131
LDI r2, 499
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
