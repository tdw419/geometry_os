; DESCRIPTION: Creates a magenta rectangular region at (354, 132) spanning 53 by 68 pixels.
; PLAN: r0=354(x), r1=132(y), r2=53(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 132
LDI r2, 53
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
