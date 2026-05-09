; DESCRIPTION: Renders a purple box of size 18x19 starting at (294, 105).
; PLAN: r0=294(x), r1=105(y), r2=18(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 105
LDI r2, 18
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
