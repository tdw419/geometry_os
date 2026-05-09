; DESCRIPTION: Creates a magenta circular shape at (374, 67) with radius 58.
; PLAN: r0=374(x), r1=67(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 67
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
