; DESCRIPTION: Renders a orange box of size 20x108 starting at (429, 98).
; PLAN: r0=429(x), r1=98(y), r2=20(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 98
LDI r2, 20
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
