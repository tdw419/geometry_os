; DESCRIPTION: Renders a yellow line between points (245, 148) and (357, 36).
; PLAN: r0=245(x1), r1=148(y1), r2=357(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 148
LDI r2, 357
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
