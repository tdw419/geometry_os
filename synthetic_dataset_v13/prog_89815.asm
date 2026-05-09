; DESCRIPTION: Renders a yellow line between points (94, 103) and (170, 151).
; PLAN: r0=94(x1), r1=103(y1), r2=170(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 103
LDI r2, 170
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
