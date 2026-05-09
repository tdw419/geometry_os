; DESCRIPTION: Places a cyan line segment connecting (356, 72) to (355, 234).
; PLAN: r0=356(x1), r1=72(y1), r2=355(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 72
LDI r2, 355
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
