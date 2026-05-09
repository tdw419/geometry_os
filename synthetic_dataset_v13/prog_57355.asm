; DESCRIPTION: Renders a magenta box of size 23x41 starting at (426, 26).
; PLAN: r0=426(x), r1=26(y), r2=23(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 26
LDI r2, 23
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
