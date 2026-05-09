; DESCRIPTION: Renders a yellow line between points (247, 24) and (326, 194).
; PLAN: r0=247(x1), r1=24(y1), r2=326(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 24
LDI r2, 326
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
