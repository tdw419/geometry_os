; DESCRIPTION: Creates a magenta rectangular region at (375, 17) spanning 116 by 68 pixels.
; PLAN: r0=375(x), r1=17(y), r2=116(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 17
LDI r2, 116
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
