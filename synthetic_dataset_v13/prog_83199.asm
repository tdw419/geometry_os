; DESCRIPTION: Creates a magenta rectangular region at (247, 159) spanning 53 by 82 pixels.
; PLAN: r0=247(x), r1=159(y), r2=53(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 159
LDI r2, 53
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
