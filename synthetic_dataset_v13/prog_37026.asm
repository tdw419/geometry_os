; DESCRIPTION: Renders a blue box of size 84x49 starting at (408, 7).
; PLAN: r0=408(x), r1=7(y), r2=84(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 7
LDI r2, 84
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
