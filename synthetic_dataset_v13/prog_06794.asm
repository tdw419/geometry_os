; DESCRIPTION: Creates a magenta rectangular region at (265, 54) spanning 103 by 72 pixels.
; PLAN: r0=265(x), r1=54(y), r2=103(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 54
LDI r2, 103
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
