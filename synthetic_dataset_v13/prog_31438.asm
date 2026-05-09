; DESCRIPTION: Renders a green line between points (244, 192) and (280, 37).
; PLAN: r0=244(x1), r1=192(y1), r2=280(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 192
LDI r2, 280
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
