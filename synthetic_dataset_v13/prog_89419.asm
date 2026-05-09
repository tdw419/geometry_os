; DESCRIPTION: Renders a green line between points (478, 244) and (68, 16).
; PLAN: r0=478(x1), r1=244(y1), r2=68(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 244
LDI r2, 68
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
