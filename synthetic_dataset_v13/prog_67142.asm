; DESCRIPTION: Draws a yellow circle centered at (370, 27) with radius 13.
; PLAN: r0=370(x), r1=27(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 27
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
