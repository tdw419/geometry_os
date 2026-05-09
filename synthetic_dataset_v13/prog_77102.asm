; DESCRIPTION: Renders a yellow line between points (5, 44) and (282, 151).
; PLAN: r0=5(x1), r1=44(y1), r2=282(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 44
LDI r2, 282
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
