; DESCRIPTION: Renders a orange box of size 102x68 starting at (5, 63).
; PLAN: r0=5(x), r1=63(y), r2=102(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 63
LDI r2, 102
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
