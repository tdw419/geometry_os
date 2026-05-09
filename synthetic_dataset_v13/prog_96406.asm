; DESCRIPTION: Renders a orange box of size 53x83 starting at (268, 78).
; PLAN: r0=268(x), r1=78(y), r2=53(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 78
LDI r2, 53
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
