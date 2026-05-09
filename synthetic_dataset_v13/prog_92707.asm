; DESCRIPTION: Renders a green line between points (478, 231) and (188, 135).
; PLAN: r0=478(x1), r1=231(y1), r2=188(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 231
LDI r2, 188
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
