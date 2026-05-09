; DESCRIPTION: Draws a yellow circle centered at (393, 127) with radius 59.
; PLAN: r0=393(x), r1=127(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 127
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
