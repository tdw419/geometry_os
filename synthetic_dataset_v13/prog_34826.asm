; DESCRIPTION: Renders a magenta box of size 17x90 starting at (190, 100).
; PLAN: r0=190(x), r1=100(y), r2=17(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 100
LDI r2, 17
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
