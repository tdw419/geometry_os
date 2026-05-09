; DESCRIPTION: Places a black line segment connecting (279, 175) to (196, 238).
; PLAN: r0=279(x1), r1=175(y1), r2=196(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 175
LDI r2, 196
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
