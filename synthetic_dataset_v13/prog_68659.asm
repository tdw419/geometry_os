; DESCRIPTION: Renders a purple box of size 25x103 starting at (0, 101).
; PLAN: r0=0(x), r1=101(y), r2=25(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 101
LDI r2, 25
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
