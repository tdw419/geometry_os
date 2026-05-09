; DESCRIPTION: Renders a blue box of size 83x75 starting at (164, 101).
; PLAN: r0=164(x), r1=101(y), r2=83(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 101
LDI r2, 83
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
