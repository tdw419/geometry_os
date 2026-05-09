; DESCRIPTION: Renders a magenta box of size 30x33 starting at (194, 65).
; PLAN: r0=194(x), r1=65(y), r2=30(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 65
LDI r2, 30
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
