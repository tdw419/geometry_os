; DESCRIPTION: Renders a blue box of size 42x110 starting at (306, 139).
; PLAN: r0=306(x), r1=139(y), r2=42(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 139
LDI r2, 42
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
