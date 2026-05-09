; DESCRIPTION: Creates a magenta rectangular region at (159, 136) spanning 42 by 82 pixels.
; PLAN: r0=159(x), r1=136(y), r2=42(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 136
LDI r2, 42
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
