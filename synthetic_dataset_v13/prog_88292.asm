; DESCRIPTION: Renders a blue box of size 32x63 starting at (92, 81).
; PLAN: r0=92(x), r1=81(y), r2=32(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 81
LDI r2, 32
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
