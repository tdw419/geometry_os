; DESCRIPTION: Renders a blue box of size 36x110 starting at (61, 12).
; PLAN: r0=61(x), r1=12(y), r2=36(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 12
LDI r2, 36
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
