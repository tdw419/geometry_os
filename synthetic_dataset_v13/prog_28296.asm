; DESCRIPTION: Creates a white rectangular region at (352, 44) spanning 43 by 76 pixels.
; PLAN: r0=352(x), r1=44(y), r2=43(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 44
LDI r2, 43
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
