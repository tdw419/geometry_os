; DESCRIPTION: Renders a magenta box of size 81x57 starting at (294, 189).
; PLAN: r0=294(x), r1=189(y), r2=81(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 189
LDI r2, 81
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
