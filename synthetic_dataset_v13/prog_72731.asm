; DESCRIPTION: Renders a black line between points (237, 150) and (91, 189).
; PLAN: r0=237(x1), r1=150(y1), r2=91(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 150
LDI r2, 91
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
