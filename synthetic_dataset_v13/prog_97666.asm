; DESCRIPTION: Renders a green line between points (156, 248) and (364, 137).
; PLAN: r0=156(x1), r1=248(y1), r2=364(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 248
LDI r2, 364
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
