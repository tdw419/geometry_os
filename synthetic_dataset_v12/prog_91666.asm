; DESCRIPTION: Creates a magenta rectangular region at (93, 114) spanning 32 by 116 pixels.
; PLAN: r0=93(x), r1=114(y), r2=32(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 114
LDI r2, 32
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
