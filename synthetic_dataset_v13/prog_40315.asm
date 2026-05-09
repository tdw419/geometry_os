; DESCRIPTION: Creates a magenta rectangular region at (254, 39) spanning 92 by 65 pixels.
; PLAN: r0=254(x), r1=39(y), r2=92(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 39
LDI r2, 92
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
