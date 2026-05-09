; DESCRIPTION: Draws a black line from (421, 253) to (478, 205).
; PLAN: r0=421(x1), r1=253(y1), r2=478(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 253
LDI r2, 478
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
