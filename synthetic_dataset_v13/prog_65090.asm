; DESCRIPTION: Renders a magenta box of size 40x15 starting at (179, 140).
; PLAN: r0=179(x), r1=140(y), r2=40(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 40
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
