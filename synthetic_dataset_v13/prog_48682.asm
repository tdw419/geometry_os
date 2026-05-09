; DESCRIPTION: Places a black line segment connecting (196, 46) to (249, 194).
; PLAN: r0=196(x1), r1=46(y1), r2=249(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 46
LDI r2, 249
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
