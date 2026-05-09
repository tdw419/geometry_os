; DESCRIPTION: Draws a black line from (248, 7) to (359, 179).
; PLAN: r0=248(x1), r1=7(y1), r2=359(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 7
LDI r2, 359
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
