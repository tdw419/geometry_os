; DESCRIPTION: Renders a blue box of size 52x31 starting at (424, 6).
; PLAN: r0=424(x), r1=6(y), r2=52(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 6
LDI r2, 52
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
