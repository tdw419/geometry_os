; DESCRIPTION: Creates a magenta rectangular region at (224, 16) spanning 22 by 96 pixels.
; PLAN: r0=224(x), r1=16(y), r2=22(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 16
LDI r2, 22
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
