; DESCRIPTION: Renders a green line between points (58, 105) and (91, 151).
; PLAN: r0=58(x1), r1=105(y1), r2=91(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 105
LDI r2, 91
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
