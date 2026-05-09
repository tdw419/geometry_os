; DESCRIPTION: Renders a green line between points (192, 149) and (360, 230).
; PLAN: r0=192(x1), r1=149(y1), r2=360(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 149
LDI r2, 360
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
