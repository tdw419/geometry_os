; DESCRIPTION: Renders a purple box of size 81x45 starting at (420, 109).
; PLAN: r0=420(x), r1=109(y), r2=81(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 109
LDI r2, 81
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
