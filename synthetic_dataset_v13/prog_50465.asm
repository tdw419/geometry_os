; DESCRIPTION: Draws a black line from (351, 243) to (49, 236).
; PLAN: r0=351(x1), r1=243(y1), r2=49(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 243
LDI r2, 49
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
