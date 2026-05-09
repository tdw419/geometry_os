; DESCRIPTION: Creates a yellow rectangular region at (203, 164) spanning 61 by 76 pixels.
; PLAN: r0=203(x), r1=164(y), r2=61(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 164
LDI r2, 61
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
