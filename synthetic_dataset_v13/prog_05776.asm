; DESCRIPTION: Draws a black line from (273, 66) to (35, 159).
; PLAN: r0=273(x1), r1=66(y1), r2=35(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 66
LDI r2, 35
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
