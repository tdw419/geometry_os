; DESCRIPTION: Draws a yellow line from (492, 128) to (472, 161).
; PLAN: r0=492(x1), r1=128(y1), r2=472(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 128
LDI r2, 472
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
