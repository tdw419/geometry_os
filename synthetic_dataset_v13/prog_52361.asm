; DESCRIPTION: Creates a magenta rectangular region at (25, 165) spanning 76 by 50 pixels.
; PLAN: r0=25(x), r1=165(y), r2=76(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 165
LDI r2, 76
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
