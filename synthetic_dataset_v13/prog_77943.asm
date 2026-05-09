; DESCRIPTION: Renders a blue box of size 26x46 starting at (330, 98).
; PLAN: r0=330(x), r1=98(y), r2=26(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 98
LDI r2, 26
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
