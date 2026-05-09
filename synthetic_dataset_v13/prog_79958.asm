; DESCRIPTION: Renders a magenta box of size 81x102 starting at (207, 27).
; PLAN: r0=207(x), r1=27(y), r2=81(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 27
LDI r2, 81
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
