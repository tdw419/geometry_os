; DESCRIPTION: Renders a purple box of size 105x105 starting at (172, 42).
; PLAN: r0=172(x), r1=42(y), r2=105(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 42
LDI r2, 105
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
