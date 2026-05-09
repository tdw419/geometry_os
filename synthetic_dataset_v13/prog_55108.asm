; DESCRIPTION: Creates a magenta circular shape at (187, 230) with radius 19.
; PLAN: r0=187(x), r1=230(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 230
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
