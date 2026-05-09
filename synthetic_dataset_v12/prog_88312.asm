; DESCRIPTION: Places a black line segment connecting (124, 37) to (466, 193).
; PLAN: r0=124(x1), r1=37(y1), r2=466(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 37
LDI r2, 466
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
