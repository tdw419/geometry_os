; DESCRIPTION: Renders a cyan line between points (141, 188) and (88, 151).
; PLAN: r0=141(x1), r1=188(y1), r2=88(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 188
LDI r2, 88
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
