; DESCRIPTION: Renders a purple box of size 66x42 starting at (375, 121).
; PLAN: r0=375(x), r1=121(y), r2=66(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 121
LDI r2, 66
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
