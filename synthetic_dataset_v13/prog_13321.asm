; DESCRIPTION: Creates a white rectangular region at (352, 96) spanning 108 by 82 pixels.
; PLAN: r0=352(x), r1=96(y), r2=108(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 96
LDI r2, 108
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
