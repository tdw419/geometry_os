; DESCRIPTION: Renders a blue box of size 85x56 starting at (151, 153).
; PLAN: r0=151(x), r1=153(y), r2=85(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 153
LDI r2, 85
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
