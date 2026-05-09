; DESCRIPTION: Renders a magenta box of size 88x23 starting at (189, 50).
; PLAN: r0=189(x), r1=50(y), r2=88(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 50
LDI r2, 88
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
