; DESCRIPTION: Renders a purple box of size 94x10 starting at (264, 39).
; PLAN: r0=264(x), r1=39(y), r2=94(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 39
LDI r2, 94
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
