; DESCRIPTION: Renders a magenta box of size 42x47 starting at (397, 17).
; PLAN: r0=397(x), r1=17(y), r2=42(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 17
LDI r2, 42
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
