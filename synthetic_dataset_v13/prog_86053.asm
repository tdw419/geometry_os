; DESCRIPTION: Creates a magenta rectangular region at (138, 16) spanning 76 by 84 pixels.
; PLAN: r0=138(x), r1=16(y), r2=76(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 16
LDI r2, 76
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
