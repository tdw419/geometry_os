; DESCRIPTION: Renders a blue box of size 42x46 starting at (442, 93).
; PLAN: r0=442(x), r1=93(y), r2=42(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 93
LDI r2, 42
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
