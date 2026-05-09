; DESCRIPTION: Creates a magenta rectangular region at (386, 115) spanning 67 by 89 pixels.
; PLAN: r0=386(x), r1=115(y), r2=67(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 115
LDI r2, 67
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
