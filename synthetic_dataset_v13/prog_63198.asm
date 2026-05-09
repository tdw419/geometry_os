; DESCRIPTION: Renders a magenta box of size 37x88 starting at (142, 79).
; PLAN: r0=142(x), r1=79(y), r2=37(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 79
LDI r2, 37
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
