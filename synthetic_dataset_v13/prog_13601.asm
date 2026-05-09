; DESCRIPTION: Creates a magenta rectangular region at (414, 64) spanning 85 by 113 pixels.
; PLAN: r0=414(x), r1=64(y), r2=85(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 64
LDI r2, 85
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
