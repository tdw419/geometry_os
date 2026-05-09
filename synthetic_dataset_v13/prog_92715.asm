; DESCRIPTION: Creates a magenta rectangular region at (18, 68) spanning 53 by 45 pixels.
; PLAN: r0=18(x), r1=68(y), r2=53(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 68
LDI r2, 53
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
