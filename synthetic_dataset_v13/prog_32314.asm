; DESCRIPTION: Renders a yellow line between points (335, 63) and (275, 244).
; PLAN: r0=335(x1), r1=63(y1), r2=275(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 63
LDI r2, 275
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
