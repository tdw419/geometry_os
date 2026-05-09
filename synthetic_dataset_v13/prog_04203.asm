; DESCRIPTION: Creates a magenta rectangular region at (2, 165) spanning 94 by 78 pixels.
; PLAN: r0=2(x), r1=165(y), r2=94(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 165
LDI r2, 94
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
