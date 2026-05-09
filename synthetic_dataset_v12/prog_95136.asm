; DESCRIPTION: Renders a purple box of size 26x13 starting at (141, 59).
; PLAN: r0=141(x), r1=59(y), r2=26(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 59
LDI r2, 26
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
