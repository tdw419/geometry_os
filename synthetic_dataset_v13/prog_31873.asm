; DESCRIPTION: Renders a orange box of size 74x38 starting at (133, 8).
; PLAN: r0=133(x), r1=8(y), r2=74(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 8
LDI r2, 74
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
