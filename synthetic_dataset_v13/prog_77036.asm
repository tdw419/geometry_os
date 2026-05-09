; DESCRIPTION: Draws a black line from (417, 5) to (248, 44).
; PLAN: r0=417(x1), r1=5(y1), r2=248(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 5
LDI r2, 248
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
