; DESCRIPTION: Renders a orange line between points (384, 106) and (394, 232).
; PLAN: r0=384(x1), r1=106(y1), r2=394(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 106
LDI r2, 394
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
