; DESCRIPTION: Draws a black line from (276, 187) to (134, 96).
; PLAN: r0=276(x1), r1=187(y1), r2=134(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 187
LDI r2, 134
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
