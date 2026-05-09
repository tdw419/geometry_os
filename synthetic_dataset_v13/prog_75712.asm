; DESCRIPTION: Renders a black line between points (242, 11) and (424, 189).
; PLAN: r0=242(x1), r1=11(y1), r2=424(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 11
LDI r2, 424
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
