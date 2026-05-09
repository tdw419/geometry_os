; DESCRIPTION: Creates a magenta circular shape at (276, 206) with radius 46.
; PLAN: r0=276(x), r1=206(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 206
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
