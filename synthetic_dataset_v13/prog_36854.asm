; DESCRIPTION: Renders a blue box of size 20x11 starting at (211, 103).
; PLAN: r0=211(x), r1=103(y), r2=20(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 103
LDI r2, 20
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
