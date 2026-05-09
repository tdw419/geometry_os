; DESCRIPTION: Creates a magenta rectangular region at (283, 55) spanning 117 by 114 pixels.
; PLAN: r0=283(x), r1=55(y), r2=117(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 55
LDI r2, 117
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
