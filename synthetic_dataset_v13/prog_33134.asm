; DESCRIPTION: Renders a orange box of size 54x85 starting at (54, 19).
; PLAN: r0=54(x), r1=19(y), r2=54(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 19
LDI r2, 54
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
