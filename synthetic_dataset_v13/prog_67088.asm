; DESCRIPTION: Places a black line segment connecting (356, 21) to (394, 60).
; PLAN: r0=356(x1), r1=21(y1), r2=394(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 21
LDI r2, 394
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
