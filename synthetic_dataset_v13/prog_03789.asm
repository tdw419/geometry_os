; DESCRIPTION: Creates a white rectangular region at (436, 46) spanning 11 by 43 pixels.
; PLAN: r0=436(x), r1=46(y), r2=11(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 46
LDI r2, 11
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
