; DESCRIPTION: Renders a blue box of size 70x39 starting at (421, 139).
; PLAN: r0=421(x), r1=139(y), r2=70(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 139
LDI r2, 70
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
