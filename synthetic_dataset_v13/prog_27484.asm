; DESCRIPTION: Places a black line segment connecting (143, 138) to (164, 85).
; PLAN: r0=143(x1), r1=138(y1), r2=164(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 138
LDI r2, 164
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
