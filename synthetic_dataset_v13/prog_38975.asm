; DESCRIPTION: Creates a magenta rectangular region at (19, 86) spanning 42 by 18 pixels.
; PLAN: r0=19(x), r1=86(y), r2=42(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 86
LDI r2, 42
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
