; DESCRIPTION: Creates a magenta rectangular region at (407, 79) spanning 102 by 76 pixels.
; PLAN: r0=407(x), r1=79(y), r2=102(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 79
LDI r2, 102
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
