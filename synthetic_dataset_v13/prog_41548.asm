; DESCRIPTION: Renders a blue box of size 38x39 starting at (250, 122).
; PLAN: r0=250(x), r1=122(y), r2=38(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 122
LDI r2, 38
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
