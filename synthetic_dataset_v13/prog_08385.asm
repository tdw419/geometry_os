; DESCRIPTION: Renders a purple box of size 33x18 starting at (354, 105).
; PLAN: r0=354(x), r1=105(y), r2=33(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 105
LDI r2, 33
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
