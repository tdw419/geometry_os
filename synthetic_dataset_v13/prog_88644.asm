; DESCRIPTION: Renders a orange box of size 53x82 starting at (325, 55).
; PLAN: r0=325(x), r1=55(y), r2=53(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 55
LDI r2, 53
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
