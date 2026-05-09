; DESCRIPTION: Draws a purple line from (229, 223) to (234, 240).
; PLAN: r0=229(x1), r1=223(y1), r2=234(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 223
LDI r2, 234
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
