; DESCRIPTION: Renders a yellow line between points (320, 245) and (423, 2).
; PLAN: r0=320(x1), r1=245(y1), r2=423(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 245
LDI r2, 423
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
