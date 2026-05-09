; DESCRIPTION: Creates a magenta circular shape at (135, 95) with radius 62.
; PLAN: r0=135(x), r1=95(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 95
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
