; DESCRIPTION: Renders a blue box of size 26x46 starting at (305, 23).
; PLAN: r0=305(x), r1=23(y), r2=26(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 23
LDI r2, 26
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
