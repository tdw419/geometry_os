; DESCRIPTION: Renders a yellow line between points (328, 250) and (263, 151).
; PLAN: r0=328(x1), r1=250(y1), r2=263(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 250
LDI r2, 263
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
