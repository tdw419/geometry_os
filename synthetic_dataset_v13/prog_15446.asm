; DESCRIPTION: Renders a magenta box of size 53x12 starting at (384, 73).
; PLAN: r0=384(x), r1=73(y), r2=53(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 73
LDI r2, 53
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
