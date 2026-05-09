; DESCRIPTION: Creates a magenta rectangular region at (375, 102) spanning 37 by 50 pixels.
; PLAN: r0=375(x), r1=102(y), r2=37(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 102
LDI r2, 37
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
