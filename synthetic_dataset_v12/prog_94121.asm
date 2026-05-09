; DESCRIPTION: Places a black line segment connecting (487, 2) to (140, 89).
; PLAN: r0=487(x1), r1=2(y1), r2=140(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 2
LDI r2, 140
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
