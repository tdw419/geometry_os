; DESCRIPTION: Renders a blue box of size 33x14 starting at (375, 231).
; PLAN: r0=375(x), r1=231(y), r2=33(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 231
LDI r2, 33
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
