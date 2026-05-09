; DESCRIPTION: Renders a purple box of size 26x102 starting at (340, 133).
; PLAN: r0=340(x), r1=133(y), r2=26(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 133
LDI r2, 26
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
