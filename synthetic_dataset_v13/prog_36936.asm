; DESCRIPTION: Renders a blue box of size 30x38 starting at (201, 35).
; PLAN: r0=201(x), r1=35(y), r2=30(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 35
LDI r2, 30
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
