; DESCRIPTION: Renders a blue box of size 41x113 starting at (182, 27).
; PLAN: r0=182(x), r1=27(y), r2=41(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 27
LDI r2, 41
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
