; DESCRIPTION: Creates a magenta rectangular region at (375, 76) spanning 69 by 76 pixels.
; PLAN: r0=375(x), r1=76(y), r2=69(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 76
LDI r2, 69
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
