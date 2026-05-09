; DESCRIPTION: Renders a orange box of size 53x68 starting at (380, 159).
; PLAN: r0=380(x), r1=159(y), r2=53(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 159
LDI r2, 53
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
