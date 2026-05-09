; DESCRIPTION: Creates a magenta rectangular region at (303, 102) spanning 46 by 63 pixels.
; PLAN: r0=303(x), r1=102(y), r2=46(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 102
LDI r2, 46
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
