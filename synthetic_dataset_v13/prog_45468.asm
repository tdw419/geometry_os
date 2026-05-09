; DESCRIPTION: Renders a magenta box of size 28x17 starting at (8, 57).
; PLAN: r0=8(x), r1=57(y), r2=28(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 57
LDI r2, 28
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
