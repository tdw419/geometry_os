; DESCRIPTION: Draws a black line from (308, 229) to (417, 157).
; PLAN: r0=308(x1), r1=229(y1), r2=417(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 229
LDI r2, 417
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
