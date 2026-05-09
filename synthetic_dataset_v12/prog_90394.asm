; DESCRIPTION: Renders a blue box of size 13x95 starting at (359, 28).
; PLAN: r0=359(x), r1=28(y), r2=13(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 28
LDI r2, 13
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
