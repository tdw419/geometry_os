; DESCRIPTION: Renders a magenta box of size 10x41 starting at (361, 101).
; PLAN: r0=361(x), r1=101(y), r2=10(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 101
LDI r2, 10
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
