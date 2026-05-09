; DESCRIPTION: Places a green line segment connecting (182, 169) to (196, 194).
; PLAN: r0=182(x1), r1=169(y1), r2=196(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 169
LDI r2, 196
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
