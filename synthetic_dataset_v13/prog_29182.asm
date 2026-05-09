; DESCRIPTION: Places a green line segment connecting (58, 151) to (96, 96).
; PLAN: r0=58(x1), r1=151(y1), r2=96(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 151
LDI r2, 96
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
