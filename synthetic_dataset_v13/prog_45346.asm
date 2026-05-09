; DESCRIPTION: Renders a yellow line between points (245, 90) and (291, 114).
; PLAN: r0=245(x1), r1=90(y1), r2=291(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 90
LDI r2, 291
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
