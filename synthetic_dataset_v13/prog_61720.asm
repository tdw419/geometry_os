; DESCRIPTION: Renders a red line between points (283, 193) and (244, 244).
; PLAN: r0=283(x1), r1=193(y1), r2=244(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 193
LDI r2, 244
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
