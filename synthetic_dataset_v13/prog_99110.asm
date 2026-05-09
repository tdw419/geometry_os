; DESCRIPTION: Renders a green line between points (44, 94) and (36, 151).
; PLAN: r0=44(x1), r1=94(y1), r2=36(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 94
LDI r2, 36
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
