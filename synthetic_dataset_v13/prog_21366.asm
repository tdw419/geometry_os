; DESCRIPTION: Creates a magenta rectangular region at (94, 52) spanning 98 by 113 pixels.
; PLAN: r0=94(x), r1=52(y), r2=98(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 52
LDI r2, 98
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
