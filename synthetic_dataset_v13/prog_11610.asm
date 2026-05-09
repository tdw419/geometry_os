; DESCRIPTION: Creates a magenta rectangular region at (337, 29) spanning 109 by 102 pixels.
; PLAN: r0=337(x), r1=29(y), r2=109(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 29
LDI r2, 109
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
