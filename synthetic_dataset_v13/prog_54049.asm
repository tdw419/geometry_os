; DESCRIPTION: Creates a magenta rectangular region at (401, 93) spanning 69 by 49 pixels.
; PLAN: r0=401(x), r1=93(y), r2=69(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 93
LDI r2, 69
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
