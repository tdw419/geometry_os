; DESCRIPTION: Places a black line segment connecting (100, 27) to (339, 120).
; PLAN: r0=100(x1), r1=27(y1), r2=339(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 27
LDI r2, 339
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
