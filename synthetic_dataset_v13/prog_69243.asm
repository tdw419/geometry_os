; DESCRIPTION: Renders a orange box of size 76x21 starting at (352, 15).
; PLAN: r0=352(x), r1=15(y), r2=76(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 15
LDI r2, 76
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
