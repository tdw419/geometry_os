; DESCRIPTION: Renders a orange box of size 30x19 starting at (216, 74).
; PLAN: r0=216(x), r1=74(y), r2=30(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 74
LDI r2, 30
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
