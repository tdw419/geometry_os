; DESCRIPTION: Renders a magenta box of size 26x62 starting at (104, 28).
; PLAN: r0=104(x), r1=28(y), r2=26(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 28
LDI r2, 26
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
