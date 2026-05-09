; DESCRIPTION: Renders a magenta box of size 81x76 starting at (213, 6).
; PLAN: r0=213(x), r1=6(y), r2=81(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 6
LDI r2, 81
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
