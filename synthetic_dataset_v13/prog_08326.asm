; DESCRIPTION: Creates a magenta rectangular region at (414, 3) spanning 74 by 79 pixels.
; PLAN: r0=414(x), r1=3(y), r2=74(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 3
LDI r2, 74
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
