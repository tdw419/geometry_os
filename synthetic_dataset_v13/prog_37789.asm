; DESCRIPTION: Creates a black rectangular region at (38, 1) spanning 76 by 50 pixels.
; PLAN: r0=38(x), r1=1(y), r2=76(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 1
LDI r2, 76
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
