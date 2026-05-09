; DESCRIPTION: Creates a magenta rectangular region at (336, 144) spanning 65 by 53 pixels.
; PLAN: r0=336(x), r1=144(y), r2=65(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 144
LDI r2, 65
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
