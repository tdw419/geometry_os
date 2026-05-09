; DESCRIPTION: Renders a green line between points (318, 72) and (54, 55).
; PLAN: r0=318(x1), r1=72(y1), r2=54(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 72
LDI r2, 54
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
