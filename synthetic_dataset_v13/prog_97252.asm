; DESCRIPTION: Creates a magenta rectangular region at (30, 154) spanning 78 by 25 pixels.
; PLAN: r0=30(x), r1=154(y), r2=78(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 154
LDI r2, 78
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
