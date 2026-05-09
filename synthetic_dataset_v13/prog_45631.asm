; DESCRIPTION: Renders a blue line between points (320, 192) and (176, 53).
; PLAN: r0=320(x1), r1=192(y1), r2=176(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 192
LDI r2, 176
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
