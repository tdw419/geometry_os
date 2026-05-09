; DESCRIPTION: Creates a magenta rectangular region at (280, 94) spanning 106 by 71 pixels.
; PLAN: r0=280(x), r1=94(y), r2=106(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 94
LDI r2, 106
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
