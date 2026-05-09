; DESCRIPTION: Renders a purple box of size 38x96 starting at (100, 38).
; PLAN: r0=100(x), r1=38(y), r2=38(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 38
LDI r2, 38
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
