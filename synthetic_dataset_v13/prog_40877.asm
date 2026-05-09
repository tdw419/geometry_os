; DESCRIPTION: Renders a purple box of size 88x13 starting at (82, 142).
; PLAN: r0=82(x), r1=142(y), r2=88(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 142
LDI r2, 88
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
