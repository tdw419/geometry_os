; DESCRIPTION: Renders a blue box of size 26x37 starting at (21, 44).
; PLAN: r0=21(x), r1=44(y), r2=26(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 44
LDI r2, 26
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
