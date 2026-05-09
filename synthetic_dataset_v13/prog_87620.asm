; DESCRIPTION: Creates a magenta rectangular region at (29, 0) spanning 104 by 19 pixels.
; PLAN: r0=29(x), r1=0(y), r2=104(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 0
LDI r2, 104
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
