; DESCRIPTION: Creates a magenta rectangular region at (232, 6) spanning 82 by 46 pixels.
; PLAN: r0=232(x), r1=6(y), r2=82(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 6
LDI r2, 82
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
