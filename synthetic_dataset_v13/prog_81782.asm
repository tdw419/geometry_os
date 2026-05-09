; DESCRIPTION: Renders a blue box of size 91x89 starting at (160, 60).
; PLAN: r0=160(x), r1=60(y), r2=91(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 60
LDI r2, 91
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
