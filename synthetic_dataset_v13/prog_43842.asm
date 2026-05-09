; DESCRIPTION: Renders a magenta box of size 64x17 starting at (75, 119).
; PLAN: r0=75(x), r1=119(y), r2=64(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 119
LDI r2, 64
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
