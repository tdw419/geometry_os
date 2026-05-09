; DESCRIPTION: Renders a green line between points (259, 10) and (176, 227).
; PLAN: r0=259(x1), r1=10(y1), r2=176(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 10
LDI r2, 176
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
