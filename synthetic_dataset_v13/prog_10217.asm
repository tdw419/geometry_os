; DESCRIPTION: Renders a purple box of size 42x87 starting at (408, 41).
; PLAN: r0=408(x), r1=41(y), r2=42(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 41
LDI r2, 42
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
