; DESCRIPTION: Places a black line segment connecting (4, 127) to (81, 193).
; PLAN: r0=4(x1), r1=127(y1), r2=81(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 127
LDI r2, 81
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
