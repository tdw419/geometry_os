; DESCRIPTION: Renders a black line between points (0, 192) and (156, 234).
; PLAN: r0=0(x1), r1=192(y1), r2=156(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 192
LDI r2, 156
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
