; DESCRIPTION: Renders a magenta box of size 36x18 starting at (15, 85).
; PLAN: r0=15(x), r1=85(y), r2=36(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 85
LDI r2, 36
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
