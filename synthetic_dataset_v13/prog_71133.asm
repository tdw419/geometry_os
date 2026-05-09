; DESCRIPTION: Renders a magenta box of size 87x104 starting at (257, 61).
; PLAN: r0=257(x), r1=61(y), r2=87(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 61
LDI r2, 87
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
