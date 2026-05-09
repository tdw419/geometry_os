; DESCRIPTION: Renders a green line between points (415, 244) and (390, 197).
; PLAN: r0=415(x1), r1=244(y1), r2=390(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 244
LDI r2, 390
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
