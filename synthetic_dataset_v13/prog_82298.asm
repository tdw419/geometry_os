; DESCRIPTION: Places a black line segment connecting (111, 7) to (48, 158).
; PLAN: r0=111(x1), r1=7(y1), r2=48(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 7
LDI r2, 48
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
