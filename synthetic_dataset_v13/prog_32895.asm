; DESCRIPTION: Renders a purple box of size 103x28 starting at (260, 101).
; PLAN: r0=260(x), r1=101(y), r2=103(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 101
LDI r2, 103
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
