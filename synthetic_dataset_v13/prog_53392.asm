; DESCRIPTION: Renders a blue box of size 98x50 starting at (201, 68).
; PLAN: r0=201(x), r1=68(y), r2=98(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 68
LDI r2, 98
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
