; DESCRIPTION: Draws a white line from (366, 253) to (83, 176).
; PLAN: r0=366(x1), r1=253(y1), r2=83(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 253
LDI r2, 83
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
