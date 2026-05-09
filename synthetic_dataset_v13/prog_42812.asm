; DESCRIPTION: Draws a black line from (187, 165) to (361, 122).
; PLAN: r0=187(x1), r1=165(y1), r2=361(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 165
LDI r2, 361
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
