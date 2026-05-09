; DESCRIPTION: Creates a magenta rectangular region at (194, 53) spanning 40 by 50 pixels.
; PLAN: r0=194(x), r1=53(y), r2=40(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 53
LDI r2, 40
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
