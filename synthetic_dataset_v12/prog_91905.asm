; DESCRIPTION: Creates a magenta rectangular region at (268, 25) spanning 86 by 108 pixels.
; PLAN: r0=268(x), r1=25(y), r2=86(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 25
LDI r2, 86
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
