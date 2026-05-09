; DESCRIPTION: Places a green line segment connecting (72, 234) to (138, 179).
; PLAN: r0=72(x1), r1=234(y1), r2=138(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 234
LDI r2, 138
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
