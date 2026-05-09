; DESCRIPTION: Draws a black line from (438, 4) to (222, 221).
; PLAN: r0=438(x1), r1=4(y1), r2=222(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 4
LDI r2, 222
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
