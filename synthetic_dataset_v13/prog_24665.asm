; DESCRIPTION: Creates a yellow rectangular region at (352, 60) spanning 76 by 11 pixels.
; PLAN: r0=352(x), r1=60(y), r2=76(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 60
LDI r2, 76
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
