; DESCRIPTION: Places a green line segment connecting (102, 48) to (62, 33).
; PLAN: r0=102(x1), r1=48(y1), r2=62(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 48
LDI r2, 62
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
