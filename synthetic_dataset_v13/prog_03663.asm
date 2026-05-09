; DESCRIPTION: Creates a magenta rectangular region at (421, 234) spanning 79 by 13 pixels.
; PLAN: r0=421(x), r1=234(y), r2=79(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 234
LDI r2, 79
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
