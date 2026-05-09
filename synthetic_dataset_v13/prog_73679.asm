; DESCRIPTION: Renders a blue box of size 58x31 starting at (196, 40).
; PLAN: r0=196(x), r1=40(y), r2=58(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 40
LDI r2, 58
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
