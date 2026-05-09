; DESCRIPTION: Renders a white line between points (292, 211) and (501, 151).
; PLAN: r0=292(x1), r1=211(y1), r2=501(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 211
LDI r2, 501
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
