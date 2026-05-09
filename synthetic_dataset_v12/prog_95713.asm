; DESCRIPTION: Renders a magenta box of size 38x19 starting at (339, 43).
; PLAN: r0=339(x), r1=43(y), r2=38(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 43
LDI r2, 38
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
