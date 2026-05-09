; DESCRIPTION: Places a black line segment connecting (26, 138) to (356, 231).
; PLAN: r0=26(x1), r1=138(y1), r2=356(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 138
LDI r2, 356
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
