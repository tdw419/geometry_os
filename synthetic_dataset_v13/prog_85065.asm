; DESCRIPTION: Renders a blue box of size 47x28 starting at (375, 6).
; PLAN: r0=375(x), r1=6(y), r2=47(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 6
LDI r2, 47
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
