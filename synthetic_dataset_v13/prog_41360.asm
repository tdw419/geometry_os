; DESCRIPTION: Draws a black line from (46, 26) to (421, 9).
; PLAN: r0=46(x1), r1=26(y1), r2=421(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 26
LDI r2, 421
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
