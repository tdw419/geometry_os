; DESCRIPTION: Renders a blue box of size 35x42 starting at (157, 73).
; PLAN: r0=157(x), r1=73(y), r2=35(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 73
LDI r2, 35
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
