; DESCRIPTION: Creates a magenta rectangular region at (164, 69) spanning 77 by 60 pixels.
; PLAN: r0=164(x), r1=69(y), r2=77(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 69
LDI r2, 77
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
