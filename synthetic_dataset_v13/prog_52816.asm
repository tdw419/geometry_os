; DESCRIPTION: Renders a magenta box of size 103x22 starting at (382, 136).
; PLAN: r0=382(x), r1=136(y), r2=103(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 136
LDI r2, 103
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
