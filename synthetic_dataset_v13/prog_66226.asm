; DESCRIPTION: Renders a green line between points (367, 242) and (192, 245).
; PLAN: r0=367(x1), r1=242(y1), r2=192(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 242
LDI r2, 192
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
