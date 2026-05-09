; DESCRIPTION: Draws a green circle centered at (344, 99) with radius 59.
; PLAN: r0=344(x), r1=99(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 99
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
