; DESCRIPTION: Draws a orange line from (22, 244) to (438, 253).
; PLAN: r0=22(x1), r1=244(y1), r2=438(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 244
LDI r2, 438
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
