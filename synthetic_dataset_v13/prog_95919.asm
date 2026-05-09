; DESCRIPTION: Renders a blue box of size 14x102 starting at (47, 50).
; PLAN: r0=47(x), r1=50(y), r2=14(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 50
LDI r2, 14
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
