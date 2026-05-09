; DESCRIPTION: Renders a orange box of size 98x43 starting at (379, 108).
; PLAN: r0=379(x), r1=108(y), r2=98(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 108
LDI r2, 98
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
