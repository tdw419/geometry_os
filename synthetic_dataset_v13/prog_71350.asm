; DESCRIPTION: Renders a orange box of size 119x82 starting at (3, 166).
; PLAN: r0=3(x), r1=166(y), r2=119(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 166
LDI r2, 119
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
