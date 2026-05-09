; DESCRIPTION: Creates a magenta rectangular region at (354, 46) spanning 20 by 114 pixels.
; PLAN: r0=354(x), r1=46(y), r2=20(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 46
LDI r2, 20
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
