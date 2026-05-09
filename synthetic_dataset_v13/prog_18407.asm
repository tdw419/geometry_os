; DESCRIPTION: Places a black line segment connecting (167, 49) to (193, 132).
; PLAN: r0=167(x1), r1=49(y1), r2=193(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 49
LDI r2, 193
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
