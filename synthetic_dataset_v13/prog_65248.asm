; DESCRIPTION: Renders a green line between points (122, 122) and (255, 245).
; PLAN: r0=122(x1), r1=122(y1), r2=255(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 122
LDI r2, 255
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
