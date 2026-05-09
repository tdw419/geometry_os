; DESCRIPTION: Places a green circle of radius 65 at center (320, 145).
; PLAN: r0=320(x), r1=145(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 145
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
