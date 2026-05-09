; DESCRIPTION: Renders a purple box of size 49x75 starting at (42, 20).
; PLAN: r0=42(x), r1=20(y), r2=49(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 20
LDI r2, 49
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
