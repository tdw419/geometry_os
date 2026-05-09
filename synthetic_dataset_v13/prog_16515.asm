; DESCRIPTION: Renders a magenta box of size 88x41 starting at (284, 6).
; PLAN: r0=284(x), r1=6(y), r2=88(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 6
LDI r2, 88
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
