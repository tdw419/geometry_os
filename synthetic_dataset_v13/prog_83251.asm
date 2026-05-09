; DESCRIPTION: Draws a black line from (248, 244) to (233, 23).
; PLAN: r0=248(x1), r1=244(y1), r2=233(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 244
LDI r2, 233
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
