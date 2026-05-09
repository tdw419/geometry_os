; DESCRIPTION: Renders a black box of size 106x108 starting at (69, 98).
; PLAN: r0=69(x), r1=98(y), r2=106(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 98
LDI r2, 106
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
