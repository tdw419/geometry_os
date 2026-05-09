; DESCRIPTION: Draws a blue line from (259, 117) to (331, 182).
; PLAN: r0=259(x1), r1=117(y1), r2=331(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 117
LDI r2, 331
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
