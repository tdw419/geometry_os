; DESCRIPTION: Creates a magenta circular shape at (284, 62) with radius 42.
; PLAN: r0=284(x), r1=62(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 62
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
