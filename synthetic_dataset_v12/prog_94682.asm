; DESCRIPTION: Renders a purple box of size 38x84 starting at (399, 42).
; PLAN: r0=399(x), r1=42(y), r2=38(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 42
LDI r2, 38
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
