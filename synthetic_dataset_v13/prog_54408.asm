; DESCRIPTION: Creates a magenta rectangular region at (455, 90) spanning 43 by 48 pixels.
; PLAN: r0=455(x), r1=90(y), r2=43(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 90
LDI r2, 43
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
