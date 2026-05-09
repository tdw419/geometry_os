; DESCRIPTION: Renders a magenta box of size 19x13 starting at (70, 41).
; PLAN: r0=70(x), r1=41(y), r2=19(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 41
LDI r2, 19
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
