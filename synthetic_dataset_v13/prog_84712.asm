; DESCRIPTION: Renders a black line between points (263, 72) and (470, 245).
; PLAN: r0=263(x1), r1=72(y1), r2=470(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 72
LDI r2, 470
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
