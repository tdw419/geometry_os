; DESCRIPTION: Renders a orange box of size 59x20 starting at (67, 75).
; PLAN: r0=67(x), r1=75(y), r2=59(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 75
LDI r2, 59
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
