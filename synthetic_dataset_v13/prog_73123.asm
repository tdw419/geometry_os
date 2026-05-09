; DESCRIPTION: Draws a yellow line from (84, 218) to (234, 52).
; PLAN: r0=84(x1), r1=218(y1), r2=234(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 218
LDI r2, 234
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
