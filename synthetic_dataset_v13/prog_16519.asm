; DESCRIPTION: Renders a yellow line between points (26, 242) and (381, 34).
; PLAN: r0=26(x1), r1=242(y1), r2=381(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 242
LDI r2, 381
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
