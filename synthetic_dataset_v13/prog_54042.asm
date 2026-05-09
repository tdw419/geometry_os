; DESCRIPTION: Renders a blue box of size 54x12 starting at (151, 63).
; PLAN: r0=151(x), r1=63(y), r2=54(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 63
LDI r2, 54
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
