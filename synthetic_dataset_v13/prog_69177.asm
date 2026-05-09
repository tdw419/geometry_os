; DESCRIPTION: Renders a purple box of size 43x59 starting at (333, 122).
; PLAN: r0=333(x), r1=122(y), r2=43(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 122
LDI r2, 43
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
