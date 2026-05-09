; DESCRIPTION: Renders a blue box of size 13x25 starting at (326, 166).
; PLAN: r0=326(x), r1=166(y), r2=13(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 166
LDI r2, 13
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
