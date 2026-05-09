; DESCRIPTION: Renders a blue box of size 106x85 starting at (281, 170).
; PLAN: r0=281(x), r1=170(y), r2=106(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 170
LDI r2, 106
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
