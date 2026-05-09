; DESCRIPTION: Renders a orange line between points (474, 93) and (31, 151).
; PLAN: r0=474(x1), r1=93(y1), r2=31(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 93
LDI r2, 31
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
