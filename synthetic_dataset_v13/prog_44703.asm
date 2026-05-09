; DESCRIPTION: Creates a magenta rectangular region at (187, 2) spanning 53 by 15 pixels.
; PLAN: r0=187(x), r1=2(y), r2=53(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 2
LDI r2, 53
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
