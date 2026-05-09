; DESCRIPTION: Renders a black line between points (421, 126) and (136, 242).
; PLAN: r0=421(x1), r1=126(y1), r2=136(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 126
LDI r2, 136
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
