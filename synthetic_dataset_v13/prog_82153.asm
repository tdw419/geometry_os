; DESCRIPTION: Draws a blue line from (418, 229) to (205, 83).
; PLAN: r0=418(x1), r1=229(y1), r2=205(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 229
LDI r2, 205
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
