; DESCRIPTION: Draws a purple line from (17, 112) to (128, 229).
; PLAN: r0=17(x1), r1=112(y1), r2=128(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 112
LDI r2, 128
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
