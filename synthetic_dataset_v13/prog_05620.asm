; DESCRIPTION: Renders a green line between points (426, 223) and (227, 15).
; PLAN: r0=426(x1), r1=223(y1), r2=227(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 223
LDI r2, 227
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
