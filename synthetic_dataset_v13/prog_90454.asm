; DESCRIPTION: Draws a black line from (229, 192) to (370, 133).
; PLAN: r0=229(x1), r1=192(y1), r2=370(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 192
LDI r2, 370
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
