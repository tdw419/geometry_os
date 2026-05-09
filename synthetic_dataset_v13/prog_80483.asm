; DESCRIPTION: Creates a magenta rectangular region at (69, 27) spanning 75 by 38 pixels.
; PLAN: r0=69(x), r1=27(y), r2=75(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 27
LDI r2, 75
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
