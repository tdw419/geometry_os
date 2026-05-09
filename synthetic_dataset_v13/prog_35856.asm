; DESCRIPTION: Places a black line segment connecting (208, 80) to (481, 193).
; PLAN: r0=208(x1), r1=80(y1), r2=481(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 80
LDI r2, 481
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
