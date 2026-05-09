; DESCRIPTION: Places a black line segment connecting (63, 138) to (274, 26).
; PLAN: r0=63(x1), r1=138(y1), r2=274(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 138
LDI r2, 274
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
