; DESCRIPTION: Draws a black circle centered at (305, 99) with radius 59.
; PLAN: r0=305(x), r1=99(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 99
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
