; DESCRIPTION: Renders a purple line between points (320, 8) and (327, 237).
; PLAN: r0=320(x1), r1=8(y1), r2=327(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 8
LDI r2, 327
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
