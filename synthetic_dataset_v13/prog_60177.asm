; DESCRIPTION: Draws a purple line from (72, 131) to (191, 210).
; PLAN: r0=72(x1), r1=131(y1), r2=191(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 131
LDI r2, 191
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
