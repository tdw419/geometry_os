; DESCRIPTION: Places a green circle of radius 72 at center (320, 113).
; PLAN: r0=320(x), r1=113(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 113
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
