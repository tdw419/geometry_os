; DESCRIPTION: Renders a blue box of size 58x41 starting at (401, 101).
; PLAN: r0=401(x), r1=101(y), r2=58(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 101
LDI r2, 58
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
