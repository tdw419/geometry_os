; DESCRIPTION: Creates a magenta rectangular region at (307, 149) spanning 78 by 95 pixels.
; PLAN: r0=307(x), r1=149(y), r2=78(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 149
LDI r2, 78
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
