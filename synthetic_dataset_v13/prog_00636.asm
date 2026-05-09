; DESCRIPTION: Renders a blue box of size 65x19 starting at (318, 50).
; PLAN: r0=318(x), r1=50(y), r2=65(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 50
LDI r2, 65
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
