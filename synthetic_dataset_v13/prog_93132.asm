; DESCRIPTION: Renders a orange box of size 69x33 starting at (375, 213).
; PLAN: r0=375(x), r1=213(y), r2=69(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 213
LDI r2, 69
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
