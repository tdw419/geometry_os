; DESCRIPTION: Draws a orange line from (351, 104) to (381, 236).
; PLAN: r0=351(x1), r1=104(y1), r2=381(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 104
LDI r2, 381
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
