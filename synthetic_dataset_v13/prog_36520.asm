; DESCRIPTION: Renders a magenta box of size 107x28 starting at (15, 105).
; PLAN: r0=15(x), r1=105(y), r2=107(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 105
LDI r2, 107
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
