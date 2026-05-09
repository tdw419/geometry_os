; DESCRIPTION: Creates a magenta circular shape at (268, 209) with radius 46.
; PLAN: r0=268(x), r1=209(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 209
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
