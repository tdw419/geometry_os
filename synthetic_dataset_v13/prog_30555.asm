; DESCRIPTION: Renders a yellow line between points (126, 227) and (247, 70).
; PLAN: r0=126(x1), r1=227(y1), r2=247(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 227
LDI r2, 247
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
