; DESCRIPTION: Renders a orange box of size 38x70 starting at (473, 19).
; PLAN: r0=473(x), r1=19(y), r2=38(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 19
LDI r2, 38
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
