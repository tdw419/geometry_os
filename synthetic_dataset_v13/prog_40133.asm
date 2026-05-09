; DESCRIPTION: Renders a purple box of size 111x14 starting at (360, 52).
; PLAN: r0=360(x), r1=52(y), r2=111(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 52
LDI r2, 111
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
