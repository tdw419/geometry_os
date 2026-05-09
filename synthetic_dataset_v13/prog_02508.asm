; DESCRIPTION: Renders a magenta box of size 99x41 starting at (5, 176).
; PLAN: r0=5(x), r1=176(y), r2=99(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 176
LDI r2, 99
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
