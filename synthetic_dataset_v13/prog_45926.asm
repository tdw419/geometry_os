; DESCRIPTION: Creates a magenta rectangular region at (356, 149) spanning 49 by 40 pixels.
; PLAN: r0=356(x), r1=149(y), r2=49(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 149
LDI r2, 49
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
