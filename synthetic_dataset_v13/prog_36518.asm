; DESCRIPTION: Draws a white circle centered at (59, 93) with radius 27.
; PLAN: r0=59(x), r1=93(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 93
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
