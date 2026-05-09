; DESCRIPTION: Renders a orange box of size 53x104 starting at (452, 46).
; PLAN: r0=452(x), r1=46(y), r2=53(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 46
LDI r2, 53
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
