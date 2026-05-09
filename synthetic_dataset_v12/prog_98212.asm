; DESCRIPTION: Renders a green line between points (318, 154) and (189, 45).
; PLAN: r0=318(x1), r1=154(y1), r2=189(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 154
LDI r2, 189
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
