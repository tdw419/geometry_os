; DESCRIPTION: Draws a black line from (438, 44) to (240, 54).
; PLAN: r0=438(x1), r1=44(y1), r2=240(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 44
LDI r2, 240
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
