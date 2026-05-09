; DESCRIPTION: Places a black line segment connecting (106, 73) to (123, 62).
; PLAN: r0=106(x1), r1=73(y1), r2=123(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 73
LDI r2, 123
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
