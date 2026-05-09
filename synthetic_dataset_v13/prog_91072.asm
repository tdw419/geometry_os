; DESCRIPTION: Renders a magenta box of size 25x49 starting at (201, 5).
; PLAN: r0=201(x), r1=5(y), r2=25(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 5
LDI r2, 25
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
