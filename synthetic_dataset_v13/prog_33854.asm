; DESCRIPTION: Renders a magenta box of size 105x14 starting at (54, 126).
; PLAN: r0=54(x), r1=126(y), r2=105(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 126
LDI r2, 105
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
