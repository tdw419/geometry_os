; DESCRIPTION: Renders a blue line between points (310, 253) and (320, 219).
; PLAN: r0=310(x1), r1=253(y1), r2=320(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 253
LDI r2, 320
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
