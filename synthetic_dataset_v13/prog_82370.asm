; DESCRIPTION: Creates a magenta rectangular region at (397, 135) spanning 104 by 15 pixels.
; PLAN: r0=397(x), r1=135(y), r2=104(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 135
LDI r2, 104
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
