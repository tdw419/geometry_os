; DESCRIPTION: Renders a orange box of size 74x63 starting at (18, 87).
; PLAN: r0=18(x), r1=87(y), r2=74(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 87
LDI r2, 74
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
