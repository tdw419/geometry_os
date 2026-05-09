; DESCRIPTION: Creates a magenta rectangular region at (51, 69) spanning 70 by 12 pixels.
; PLAN: r0=51(x), r1=69(y), r2=70(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 69
LDI r2, 70
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
