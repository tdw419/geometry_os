; DESCRIPTION: Renders a red line between points (91, 248) and (245, 232).
; PLAN: r0=91(x1), r1=248(y1), r2=245(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 248
LDI r2, 245
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
