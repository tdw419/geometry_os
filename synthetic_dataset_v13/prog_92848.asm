; DESCRIPTION: Creates a magenta rectangular region at (191, 157) spanning 90 by 81 pixels.
; PLAN: r0=191(x), r1=157(y), r2=90(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 157
LDI r2, 90
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
