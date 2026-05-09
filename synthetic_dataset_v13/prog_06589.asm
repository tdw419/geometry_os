; DESCRIPTION: Renders a magenta box of size 91x70 starting at (41, 93).
; PLAN: r0=41(x), r1=93(y), r2=91(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 93
LDI r2, 91
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
