; DESCRIPTION: Creates a magenta rectangular region at (280, 72) spanning 96 by 86 pixels.
; PLAN: r0=280(x), r1=72(y), r2=96(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 72
LDI r2, 96
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
