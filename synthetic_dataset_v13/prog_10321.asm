; DESCRIPTION: Places a yellow circle of radius 22 at center (320, 180).
; PLAN: r0=320(x), r1=180(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 180
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
