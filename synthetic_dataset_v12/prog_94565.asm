; DESCRIPTION: Renders a yellow line between points (165, 188) and (367, 151).
; PLAN: r0=165(x1), r1=188(y1), r2=367(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 188
LDI r2, 367
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
