; DESCRIPTION: Creates a magenta rectangular region at (461, 45) spanning 45 by 70 pixels.
; PLAN: r0=461(x), r1=45(y), r2=45(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 45
LDI r2, 45
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
