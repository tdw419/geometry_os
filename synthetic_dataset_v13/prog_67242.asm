; DESCRIPTION: Renders a magenta box of size 29x38 starting at (257, 162).
; PLAN: r0=257(x), r1=162(y), r2=29(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 162
LDI r2, 29
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
