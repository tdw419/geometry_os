; DESCRIPTION: Creates a magenta rectangular region at (405, 53) spanning 74 by 98 pixels.
; PLAN: r0=405(x), r1=53(y), r2=74(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 53
LDI r2, 74
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
