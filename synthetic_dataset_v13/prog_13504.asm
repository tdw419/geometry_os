; DESCRIPTION: Creates a magenta rectangular region at (30, 30) spanning 76 by 27 pixels.
; PLAN: r0=30(x), r1=30(y), r2=76(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 30
LDI r2, 76
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
