; DESCRIPTION: Renders a yellow line between points (294, 204) and (334, 63).
; PLAN: r0=294(x1), r1=204(y1), r2=334(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 204
LDI r2, 334
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
