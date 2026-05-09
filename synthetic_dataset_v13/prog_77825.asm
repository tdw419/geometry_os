; DESCRIPTION: Renders a purple box of size 18x20 starting at (272, 18).
; PLAN: r0=272(x), r1=18(y), r2=18(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 18
LDI r2, 18
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
