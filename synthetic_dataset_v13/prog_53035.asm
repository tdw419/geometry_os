; DESCRIPTION: Places a black line segment connecting (168, 115) to (183, 51).
; PLAN: r0=168(x1), r1=115(y1), r2=183(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 115
LDI r2, 183
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
