; DESCRIPTION: Places a black line segment connecting (48, 121) to (449, 56).
; PLAN: r0=48(x1), r1=121(y1), r2=449(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 121
LDI r2, 449
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
