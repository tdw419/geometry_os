; DESCRIPTION: Creates a black rectangular region at (400, 203) spanning 36 by 53 pixels.
; PLAN: r0=400(x), r1=203(y), r2=36(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 203
LDI r2, 36
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
