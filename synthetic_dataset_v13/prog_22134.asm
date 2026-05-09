; DESCRIPTION: Renders a yellow line between points (275, 68) and (17, 254).
; PLAN: r0=275(x1), r1=68(y1), r2=17(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 68
LDI r2, 17
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
