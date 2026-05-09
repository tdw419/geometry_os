; DESCRIPTION: Renders a purple box of size 84x81 starting at (161, 103).
; PLAN: r0=161(x), r1=103(y), r2=84(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 103
LDI r2, 84
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
