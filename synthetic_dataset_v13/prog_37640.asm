; DESCRIPTION: Creates a magenta rectangular region at (280, 56) spanning 86 by 43 pixels.
; PLAN: r0=280(x), r1=56(y), r2=86(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 56
LDI r2, 86
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
