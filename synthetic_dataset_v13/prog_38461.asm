; DESCRIPTION: Places a green line segment connecting (189, 135) to (58, 112).
; PLAN: r0=189(x1), r1=135(y1), r2=58(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 135
LDI r2, 58
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
