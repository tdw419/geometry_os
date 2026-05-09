; DESCRIPTION: Renders a magenta box of size 24x48 starting at (84, 24).
; PLAN: r0=84(x), r1=24(y), r2=24(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 24
LDI r2, 24
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
