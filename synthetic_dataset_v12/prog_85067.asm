; DESCRIPTION: Creates a magenta rectangular region at (257, 80) spanning 77 by 52 pixels.
; PLAN: r0=257(x), r1=80(y), r2=77(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 80
LDI r2, 77
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
