; DESCRIPTION: Places a black line segment connecting (79, 46) to (149, 47).
; PLAN: r0=79(x1), r1=46(y1), r2=149(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 46
LDI r2, 149
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
