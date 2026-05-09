; DESCRIPTION: Creates a magenta rectangular region at (381, 148) spanning 86 by 77 pixels.
; PLAN: r0=381(x), r1=148(y), r2=86(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 148
LDI r2, 86
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
