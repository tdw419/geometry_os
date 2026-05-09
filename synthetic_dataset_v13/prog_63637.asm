; DESCRIPTION: Renders a magenta box of size 26x41 starting at (387, 93).
; PLAN: r0=387(x), r1=93(y), r2=26(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 93
LDI r2, 26
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
