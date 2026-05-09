; DESCRIPTION: Renders a orange box of size 93x22 starting at (246, 34).
; PLAN: r0=246(x), r1=34(y), r2=93(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 34
LDI r2, 93
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
