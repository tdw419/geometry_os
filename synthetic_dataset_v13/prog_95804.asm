; DESCRIPTION: Renders a magenta box of size 92x101 starting at (371, 125).
; PLAN: r0=371(x), r1=125(y), r2=92(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 125
LDI r2, 92
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
