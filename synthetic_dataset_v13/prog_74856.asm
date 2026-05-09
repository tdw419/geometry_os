; DESCRIPTION: Draws a black line from (251, 72) to (97, 76).
; PLAN: r0=251(x1), r1=72(y1), r2=97(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 72
LDI r2, 97
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
