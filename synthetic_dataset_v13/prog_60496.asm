; DESCRIPTION: Creates a magenta rectangular region at (405, 134) spanning 99 by 115 pixels.
; PLAN: r0=405(x), r1=134(y), r2=99(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 134
LDI r2, 99
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
