; DESCRIPTION: Renders a orange box of size 95x34 starting at (333, 203).
; PLAN: r0=333(x), r1=203(y), r2=95(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 203
LDI r2, 95
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
