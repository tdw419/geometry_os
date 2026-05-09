; DESCRIPTION: Draws a black line from (187, 253) to (423, 105).
; PLAN: r0=187(x1), r1=253(y1), r2=423(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 253
LDI r2, 423
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
