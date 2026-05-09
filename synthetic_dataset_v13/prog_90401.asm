; DESCRIPTION: Creates a magenta circular shape at (202, 198) with radius 35.
; PLAN: r0=202(x), r1=198(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 198
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
