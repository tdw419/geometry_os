; DESCRIPTION: Renders a yellow line between points (324, 227) and (30, 146).
; PLAN: r0=324(x1), r1=227(y1), r2=30(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 227
LDI r2, 30
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
