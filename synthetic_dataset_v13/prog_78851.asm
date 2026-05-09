; DESCRIPTION: Renders a magenta box of size 108x110 starting at (56, 13).
; PLAN: r0=56(x), r1=13(y), r2=108(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 13
LDI r2, 108
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
