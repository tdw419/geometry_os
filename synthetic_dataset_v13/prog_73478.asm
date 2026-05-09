; DESCRIPTION: Places a green circle of radius 59 at center (412, 135).
; PLAN: r0=412(x), r1=135(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 135
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
