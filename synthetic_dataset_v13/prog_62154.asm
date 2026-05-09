; DESCRIPTION: Creates a magenta rectangular region at (265, 31) spanning 54 by 96 pixels.
; PLAN: r0=265(x), r1=31(y), r2=54(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 31
LDI r2, 54
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
