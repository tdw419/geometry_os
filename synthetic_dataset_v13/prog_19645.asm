; DESCRIPTION: Renders a magenta box of size 90x18 starting at (177, 100).
; PLAN: r0=177(x), r1=100(y), r2=90(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 100
LDI r2, 90
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
