; DESCRIPTION: Renders a blue box of size 39x116 starting at (53, 83).
; PLAN: r0=53(x), r1=83(y), r2=39(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 83
LDI r2, 39
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
