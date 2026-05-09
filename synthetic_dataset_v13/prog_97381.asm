; DESCRIPTION: Renders a blue line between points (422, 44) and (320, 224).
; PLAN: r0=422(x1), r1=44(y1), r2=320(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 44
LDI r2, 320
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
