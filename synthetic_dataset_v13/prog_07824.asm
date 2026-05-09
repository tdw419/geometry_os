; DESCRIPTION: Renders a magenta box of size 101x114 starting at (365, 5).
; PLAN: r0=365(x), r1=5(y), r2=101(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 5
LDI r2, 101
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
