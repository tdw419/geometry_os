; DESCRIPTION: Renders a magenta box of size 20x87 starting at (72, 136).
; PLAN: r0=72(x), r1=136(y), r2=20(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 136
LDI r2, 20
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
