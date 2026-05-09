; DESCRIPTION: Renders a purple box of size 28x18 starting at (240, 170).
; PLAN: r0=240(x), r1=170(y), r2=28(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 170
LDI r2, 28
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
