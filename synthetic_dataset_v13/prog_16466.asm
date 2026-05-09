; DESCRIPTION: Renders a black line between points (381, 226) and (294, 151).
; PLAN: r0=381(x1), r1=226(y1), r2=294(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 226
LDI r2, 294
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
