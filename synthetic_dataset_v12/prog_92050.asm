; DESCRIPTION: Creates a magenta rectangular region at (157, 156) spanning 111 by 26 pixels.
; PLAN: r0=157(x), r1=156(y), r2=111(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 156
LDI r2, 111
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
