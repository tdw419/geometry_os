; DESCRIPTION: Creates a magenta rectangular region at (414, 148) spanning 19 by 27 pixels.
; PLAN: r0=414(x), r1=148(y), r2=19(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 148
LDI r2, 19
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
