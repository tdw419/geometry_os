; DESCRIPTION: Renders a orange box of size 22x38 starting at (81, 31).
; PLAN: r0=81(x), r1=31(y), r2=22(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 31
LDI r2, 22
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
