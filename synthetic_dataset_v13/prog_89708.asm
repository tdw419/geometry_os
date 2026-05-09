; DESCRIPTION: Renders a magenta box of size 88x50 starting at (13, 39).
; PLAN: r0=13(x), r1=39(y), r2=88(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 39
LDI r2, 88
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
