; DESCRIPTION: Renders a blue box of size 46x114 starting at (156, 73).
; PLAN: r0=156(x), r1=73(y), r2=46(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 73
LDI r2, 46
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
