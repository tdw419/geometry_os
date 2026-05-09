; DESCRIPTION: Creates a magenta rectangular region at (268, 45) spanning 113 by 71 pixels.
; PLAN: r0=268(x), r1=45(y), r2=113(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 45
LDI r2, 113
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
