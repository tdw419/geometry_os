; DESCRIPTION: Draws a black line from (236, 77) to (438, 144).
; PLAN: r0=236(x1), r1=77(y1), r2=438(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 77
LDI r2, 438
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
