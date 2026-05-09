; DESCRIPTION: Creates a magenta circular shape at (303, 197) with radius 39.
; PLAN: r0=303(x), r1=197(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 197
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
