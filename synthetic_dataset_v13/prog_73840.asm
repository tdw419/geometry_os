; DESCRIPTION: Renders a purple box of size 14x25 starting at (338, 8).
; PLAN: r0=338(x), r1=8(y), r2=14(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 8
LDI r2, 14
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
