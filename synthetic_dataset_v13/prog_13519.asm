; DESCRIPTION: Creates a magenta rectangular region at (187, 22) spanning 60 by 20 pixels.
; PLAN: r0=187(x), r1=22(y), r2=60(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 22
LDI r2, 60
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
