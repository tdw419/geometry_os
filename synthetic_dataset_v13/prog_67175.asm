; DESCRIPTION: Renders a blue box of size 19x30 starting at (55, 190).
; PLAN: r0=55(x), r1=190(y), r2=19(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 190
LDI r2, 19
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
