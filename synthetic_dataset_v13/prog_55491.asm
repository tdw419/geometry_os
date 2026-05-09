; DESCRIPTION: Draws a black line from (204, 187) to (290, 45).
; PLAN: r0=204(x1), r1=187(y1), r2=290(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 187
LDI r2, 290
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
