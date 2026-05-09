; DESCRIPTION: Renders a blue box of size 56x37 starting at (199, 68).
; PLAN: r0=199(x), r1=68(y), r2=56(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 68
LDI r2, 56
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
