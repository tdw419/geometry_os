; DESCRIPTION: Creates a magenta rectangular region at (202, 40) spanning 20 by 69 pixels.
; PLAN: r0=202(x), r1=40(y), r2=20(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 40
LDI r2, 20
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
