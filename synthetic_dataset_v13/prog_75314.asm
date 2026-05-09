; DESCRIPTION: Renders a green box of size 114x92 starting at (72, 136).
; PLAN: r0=72(x), r1=136(y), r2=114(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 136
LDI r2, 114
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
