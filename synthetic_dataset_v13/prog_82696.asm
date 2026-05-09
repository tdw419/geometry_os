; DESCRIPTION: Renders a magenta line between points (283, 176) and (62, 184).
; PLAN: r0=283(x1), r1=176(y1), r2=62(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 176
LDI r2, 62
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
