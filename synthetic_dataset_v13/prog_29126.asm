; DESCRIPTION: Renders a blue box of size 13x53 starting at (268, 110).
; PLAN: r0=268(x), r1=110(y), r2=13(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 110
LDI r2, 13
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
