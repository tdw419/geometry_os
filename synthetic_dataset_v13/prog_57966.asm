; DESCRIPTION: Draws a black line from (248, 132) to (22, 221).
; PLAN: r0=248(x1), r1=132(y1), r2=22(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 132
LDI r2, 22
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
