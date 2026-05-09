; DESCRIPTION: Creates a blue circular shape at (306, 171) with radius 27.
; PLAN: r0=306(x), r1=171(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 171
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
