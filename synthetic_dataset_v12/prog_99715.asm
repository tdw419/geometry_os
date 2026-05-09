; DESCRIPTION: Renders a purple box of size 82x118 starting at (364, 42).
; PLAN: r0=364(x), r1=42(y), r2=82(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 42
LDI r2, 82
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
