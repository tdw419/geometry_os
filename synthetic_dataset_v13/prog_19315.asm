; DESCRIPTION: Renders a blue box of size 108x12 starting at (253, 145).
; PLAN: r0=253(x), r1=145(y), r2=108(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 145
LDI r2, 108
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
