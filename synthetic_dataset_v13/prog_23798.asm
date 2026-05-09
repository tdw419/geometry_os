; DESCRIPTION: Creates a magenta rectangular region at (14, 33) spanning 55 by 90 pixels.
; PLAN: r0=14(x), r1=33(y), r2=55(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 33
LDI r2, 55
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
