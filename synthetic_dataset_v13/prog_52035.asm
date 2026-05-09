; DESCRIPTION: Creates a magenta rectangular region at (341, 181) spanning 64 by 50 pixels.
; PLAN: r0=341(x), r1=181(y), r2=64(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 181
LDI r2, 64
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
