; DESCRIPTION: Renders a magenta box of size 32x11 starting at (145, 29).
; PLAN: r0=145(x), r1=29(y), r2=32(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 29
LDI r2, 32
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
