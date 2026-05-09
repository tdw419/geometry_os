; DESCRIPTION: Places a blue line segment connecting (320, 86) to (103, 17).
; PLAN: r0=320(x1), r1=86(y1), r2=103(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 86
LDI r2, 103
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
