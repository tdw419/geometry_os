; DESCRIPTION: Renders a purple box of size 42x41 starting at (219, 207).
; PLAN: r0=219(x), r1=207(y), r2=42(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 207
LDI r2, 42
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
