; DESCRIPTION: Creates a magenta rectangular region at (211, 143) spanning 19 by 78 pixels.
; PLAN: r0=211(x), r1=143(y), r2=19(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 143
LDI r2, 19
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
