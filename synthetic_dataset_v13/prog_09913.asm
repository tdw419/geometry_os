; DESCRIPTION: Places a black line segment connecting (168, 172) to (301, 79).
; PLAN: r0=168(x1), r1=172(y1), r2=301(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 172
LDI r2, 301
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
