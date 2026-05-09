; DESCRIPTION: Places a black line segment connecting (26, 154) to (125, 43).
; PLAN: r0=26(x1), r1=154(y1), r2=125(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 154
LDI r2, 125
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
