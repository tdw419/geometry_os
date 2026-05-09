; DESCRIPTION: Draws a red circle centered at (435, 27) with radius 17.
; PLAN: r0=435(x), r1=27(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 27
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
