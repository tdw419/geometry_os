; DESCRIPTION: Renders a purple box of size 74x42 starting at (241, 4).
; PLAN: r0=241(x), r1=4(y), r2=74(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 4
LDI r2, 74
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
