; DESCRIPTION: Creates a white rectangular region at (184, 108) spanning 69 by 19 pixels.
; PLAN: r0=184(x), r1=108(y), r2=69(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 108
LDI r2, 69
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
