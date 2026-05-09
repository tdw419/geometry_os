; DESCRIPTION: Renders a blue box of size 37x39 starting at (190, 30).
; PLAN: r0=190(x), r1=30(y), r2=37(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 30
LDI r2, 37
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
