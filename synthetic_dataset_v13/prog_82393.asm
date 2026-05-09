; DESCRIPTION: Renders a blue box of size 108x41 starting at (42, 89).
; PLAN: r0=42(x), r1=89(y), r2=108(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 89
LDI r2, 108
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
