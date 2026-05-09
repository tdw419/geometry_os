; DESCRIPTION: Draws a yellow circle centered at (280, 127) with radius 36.
; PLAN: r0=280(x), r1=127(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 127
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
