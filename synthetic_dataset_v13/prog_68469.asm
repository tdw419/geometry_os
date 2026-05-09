; DESCRIPTION: Creates a magenta rectangular region at (53, 46) spanning 44 by 37 pixels.
; PLAN: r0=53(x), r1=46(y), r2=44(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 46
LDI r2, 44
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
