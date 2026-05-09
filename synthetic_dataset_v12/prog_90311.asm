; DESCRIPTION: Renders a magenta box of size 30x76 starting at (390, 17).
; PLAN: r0=390(x), r1=17(y), r2=30(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 17
LDI r2, 30
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
