; DESCRIPTION: Renders a purple box of size 78x42 starting at (162, 2).
; PLAN: r0=162(x), r1=2(y), r2=78(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 2
LDI r2, 78
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
