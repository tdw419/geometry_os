; DESCRIPTION: Draws a black line from (438, 10) to (110, 99).
; PLAN: r0=438(x1), r1=10(y1), r2=110(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 10
LDI r2, 110
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
