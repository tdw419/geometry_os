; DESCRIPTION: Renders a magenta box of size 50x110 starting at (318, 11).
; PLAN: r0=318(x), r1=11(y), r2=50(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 11
LDI r2, 50
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
