; DESCRIPTION: Creates a magenta rectangular region at (109, 191) spanning 28 by 61 pixels.
; PLAN: r0=109(x), r1=191(y), r2=28(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 191
LDI r2, 28
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
