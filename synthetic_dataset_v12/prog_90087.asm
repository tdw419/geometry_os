; DESCRIPTION: Creates a magenta rectangular region at (240, 126) spanning 85 by 53 pixels.
; PLAN: r0=240(x), r1=126(y), r2=85(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 126
LDI r2, 85
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
