; DESCRIPTION: Renders a green box of size 90x43 starting at (266, 101).
; PLAN: r0=266(x), r1=101(y), r2=90(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 101
LDI r2, 90
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
