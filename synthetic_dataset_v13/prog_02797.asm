; DESCRIPTION: Renders a green line between points (302, 154) and (128, 84).
; PLAN: r0=302(x1), r1=154(y1), r2=128(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 154
LDI r2, 128
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
