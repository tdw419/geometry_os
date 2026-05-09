; DESCRIPTION: Renders a purple box of size 24x116 starting at (383, 122).
; PLAN: r0=383(x), r1=122(y), r2=24(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 122
LDI r2, 24
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
