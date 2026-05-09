; DESCRIPTION: Creates a magenta rectangular region at (256, 55) spanning 55 by 13 pixels.
; PLAN: r0=256(x), r1=55(y), r2=55(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 55
LDI r2, 55
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
