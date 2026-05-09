; DESCRIPTION: Renders a orange box of size 53x104 starting at (181, 10).
; PLAN: r0=181(x), r1=10(y), r2=53(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 10
LDI r2, 53
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
