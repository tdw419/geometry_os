; DESCRIPTION: Renders a blue box of size 87x38 starting at (252, 201).
; PLAN: r0=252(x), r1=201(y), r2=87(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 201
LDI r2, 87
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
