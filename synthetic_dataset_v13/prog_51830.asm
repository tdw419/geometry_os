; DESCRIPTION: Creates a magenta rectangular region at (367, 105) spanning 56 by 109 pixels.
; PLAN: r0=367(x), r1=105(y), r2=56(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 105
LDI r2, 56
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
