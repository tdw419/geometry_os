; DESCRIPTION: Renders a blue box of size 109x114 starting at (174, 98).
; PLAN: r0=174(x), r1=98(y), r2=109(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 98
LDI r2, 109
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
