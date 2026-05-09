; DESCRIPTION: Places a green circle of radius 17 at center (142, 113).
; PLAN: r0=142(x), r1=113(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 113
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
