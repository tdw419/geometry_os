; DESCRIPTION: Renders a magenta box of size 70x61 starting at (19, 189).
; PLAN: r0=19(x), r1=189(y), r2=70(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 189
LDI r2, 70
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
