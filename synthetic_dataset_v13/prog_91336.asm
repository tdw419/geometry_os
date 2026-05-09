; DESCRIPTION: Renders a blue box of size 12x85 starting at (324, 14).
; PLAN: r0=324(x), r1=14(y), r2=12(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 14
LDI r2, 12
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
