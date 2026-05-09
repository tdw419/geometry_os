; DESCRIPTION: Draws a black line from (201, 146) to (223, 25).
; PLAN: r0=201(x1), r1=146(y1), r2=223(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 146
LDI r2, 223
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
