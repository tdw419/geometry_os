; DESCRIPTION: Creates a purple rectangular region at (184, 28) spanning 102 by 43 pixels.
; PLAN: r0=184(x), r1=28(y), r2=102(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 28
LDI r2, 102
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
