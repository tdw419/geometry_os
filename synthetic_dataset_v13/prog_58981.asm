; DESCRIPTION: Places a green line segment connecting (101, 134) to (234, 92).
; PLAN: r0=101(x1), r1=134(y1), r2=234(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 134
LDI r2, 234
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
