; DESCRIPTION: Renders a blue box of size 96x14 starting at (18, 98).
; PLAN: r0=18(x), r1=98(y), r2=96(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 98
LDI r2, 96
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
