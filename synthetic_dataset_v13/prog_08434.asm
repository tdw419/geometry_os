; DESCRIPTION: Renders a green box of size 118x56 starting at (72, 84).
; PLAN: r0=72(x), r1=84(y), r2=118(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 84
LDI r2, 118
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
