; DESCRIPTION: Renders a blue box of size 93x18 starting at (320, 181).
; PLAN: r0=320(x), r1=181(y), r2=93(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 181
LDI r2, 93
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
