; DESCRIPTION: Places a black line segment connecting (162, 51) to (151, 226).
; PLAN: r0=162(x1), r1=51(y1), r2=151(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 51
LDI r2, 151
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
