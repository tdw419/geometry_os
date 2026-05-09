; DESCRIPTION: Renders a black line between points (222, 53) and (2, 192).
; PLAN: r0=222(x1), r1=53(y1), r2=2(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 53
LDI r2, 2
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
