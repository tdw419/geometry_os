; DESCRIPTION: Creates a magenta rectangular region at (105, 140) spanning 27 by 23 pixels.
; PLAN: r0=105(x), r1=140(y), r2=27(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 140
LDI r2, 27
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
