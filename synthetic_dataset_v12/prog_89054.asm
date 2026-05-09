; DESCRIPTION: Creates a magenta rectangular region at (229, 125) spanning 76 by 49 pixels.
; PLAN: r0=229(x), r1=125(y), r2=76(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 125
LDI r2, 76
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
