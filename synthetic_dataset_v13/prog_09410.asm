; DESCRIPTION: Renders a orange box of size 50x114 starting at (230, 108).
; PLAN: r0=230(x), r1=108(y), r2=50(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 108
LDI r2, 50
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
