; DESCRIPTION: Renders a purple box of size 59x46 starting at (269, 53).
; PLAN: r0=269(x), r1=53(y), r2=59(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 53
LDI r2, 59
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
