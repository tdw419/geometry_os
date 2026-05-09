; DESCRIPTION: Creates a magenta rectangular region at (280, 171) spanning 76 by 14 pixels.
; PLAN: r0=280(x), r1=171(y), r2=76(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 171
LDI r2, 76
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
