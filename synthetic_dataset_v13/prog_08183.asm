; DESCRIPTION: Creates a black rectangular region at (217, 36) spanning 62 by 47 pixels.
; PLAN: r0=217(x), r1=36(y), r2=62(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 36
LDI r2, 62
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
