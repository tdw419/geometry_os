; DESCRIPTION: Renders a magenta box of size 50x11 starting at (418, 110).
; PLAN: r0=418(x), r1=110(y), r2=50(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 110
LDI r2, 50
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
