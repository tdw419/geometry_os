; DESCRIPTION: Renders a magenta box of size 106x49 starting at (386, 41).
; PLAN: r0=386(x), r1=41(y), r2=106(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 41
LDI r2, 106
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
