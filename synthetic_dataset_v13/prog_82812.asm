; DESCRIPTION: Renders a black line between points (109, 62) and (101, 242).
; PLAN: r0=109(x1), r1=62(y1), r2=101(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 62
LDI r2, 101
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
