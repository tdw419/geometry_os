; DESCRIPTION: Places a black line segment connecting (72, 12) to (71, 6).
; PLAN: r0=72(x1), r1=12(y1), r2=71(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 12
LDI r2, 71
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
