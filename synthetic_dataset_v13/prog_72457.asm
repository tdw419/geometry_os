; DESCRIPTION: Creates a magenta rectangular region at (265, 86) spanning 97 by 94 pixels.
; PLAN: r0=265(x), r1=86(y), r2=97(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 86
LDI r2, 97
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
