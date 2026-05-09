; DESCRIPTION: Renders a magenta box of size 30x43 starting at (254, 23).
; PLAN: r0=254(x), r1=23(y), r2=30(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 23
LDI r2, 30
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
