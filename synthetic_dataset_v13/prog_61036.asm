; DESCRIPTION: Renders a purple box of size 108x88 starting at (262, 37).
; PLAN: r0=262(x), r1=37(y), r2=108(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 37
LDI r2, 108
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
