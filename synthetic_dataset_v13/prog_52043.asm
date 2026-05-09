; DESCRIPTION: Renders a magenta box of size 18x11 starting at (179, 211).
; PLAN: r0=179(x), r1=211(y), r2=18(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 211
LDI r2, 18
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
