; DESCRIPTION: Draws a black line from (236, 44) to (309, 87).
; PLAN: r0=236(x1), r1=44(y1), r2=309(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 44
LDI r2, 309
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
