; DESCRIPTION: Renders a magenta box of size 75x56 starting at (426, 71).
; PLAN: r0=426(x), r1=71(y), r2=75(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 71
LDI r2, 75
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
