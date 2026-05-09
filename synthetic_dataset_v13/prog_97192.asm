; DESCRIPTION: Places a green line segment connecting (151, 177) to (93, 152).
; PLAN: r0=151(x1), r1=177(y1), r2=93(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 177
LDI r2, 93
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
