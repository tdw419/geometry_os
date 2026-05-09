; DESCRIPTION: Places a black line segment connecting (161, 188) to (96, 193).
; PLAN: r0=161(x1), r1=188(y1), r2=96(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 188
LDI r2, 96
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
