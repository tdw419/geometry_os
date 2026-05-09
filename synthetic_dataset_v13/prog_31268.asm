; DESCRIPTION: Renders a purple box of size 72x65 starting at (190, 78).
; PLAN: r0=190(x), r1=78(y), r2=72(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 78
LDI r2, 72
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
