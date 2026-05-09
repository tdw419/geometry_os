; DESCRIPTION: Renders a white box of size 40x58 starting at (84, 144).
; PLAN: r0=84(x), r1=144(y), r2=40(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 144
LDI r2, 40
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
