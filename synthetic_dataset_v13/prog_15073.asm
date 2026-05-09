; DESCRIPTION: Draws a black line from (125, 8) to (107, 110).
; PLAN: r0=125(x1), r1=8(y1), r2=107(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 8
LDI r2, 107
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
