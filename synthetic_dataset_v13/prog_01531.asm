; DESCRIPTION: Creates a magenta rectangular region at (244, 159) spanning 114 by 17 pixels.
; PLAN: r0=244(x), r1=159(y), r2=114(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 159
LDI r2, 114
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
