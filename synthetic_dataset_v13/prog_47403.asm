; DESCRIPTION: Draws a black line from (278, 60) to (500, 176).
; PLAN: r0=278(x1), r1=60(y1), r2=500(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 60
LDI r2, 500
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
