; DESCRIPTION: Renders a magenta box of size 81x102 starting at (182, 142).
; PLAN: r0=182(x), r1=142(y), r2=81(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 142
LDI r2, 81
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
