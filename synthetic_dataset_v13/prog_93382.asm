; DESCRIPTION: Renders a purple box of size 70x58 starting at (345, 42).
; PLAN: r0=345(x), r1=42(y), r2=70(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 42
LDI r2, 70
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
