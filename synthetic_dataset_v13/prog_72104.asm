; DESCRIPTION: Renders a blue box of size 110x48 starting at (111, 15).
; PLAN: r0=111(x), r1=15(y), r2=110(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 15
LDI r2, 110
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
