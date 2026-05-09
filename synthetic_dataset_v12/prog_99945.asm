; DESCRIPTION: Renders a blue box of size 24x32 starting at (55, 212).
; PLAN: r0=55(x), r1=212(y), r2=24(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 212
LDI r2, 24
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
