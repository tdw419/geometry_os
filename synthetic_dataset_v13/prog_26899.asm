; DESCRIPTION: Draws a black line from (122, 115) to (91, 156).
; PLAN: r0=122(x1), r1=115(y1), r2=91(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 115
LDI r2, 91
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
