; DESCRIPTION: Renders a orange box of size 52x76 starting at (23, 104).
; PLAN: r0=23(x), r1=104(y), r2=52(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 104
LDI r2, 52
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
