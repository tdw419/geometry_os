; DESCRIPTION: Draws a black line from (189, 117) to (478, 86).
; PLAN: r0=189(x1), r1=117(y1), r2=478(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 117
LDI r2, 478
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
