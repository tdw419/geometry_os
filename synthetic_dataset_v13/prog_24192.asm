; DESCRIPTION: Draws a yellow circle centered at (153, 82) with radius 27.
; PLAN: r0=153(x), r1=82(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 82
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
