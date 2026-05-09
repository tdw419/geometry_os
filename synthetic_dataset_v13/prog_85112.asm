; DESCRIPTION: Renders a blue box of size 111x110 starting at (64, 10).
; PLAN: r0=64(x), r1=10(y), r2=111(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 10
LDI r2, 111
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
