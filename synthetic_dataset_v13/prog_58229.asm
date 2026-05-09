; DESCRIPTION: Renders a orange box of size 109x13 starting at (212, 108).
; PLAN: r0=212(x), r1=108(y), r2=109(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 108
LDI r2, 109
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
