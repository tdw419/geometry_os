; DESCRIPTION: Renders a magenta box of size 101x54 starting at (297, 110).
; PLAN: r0=297(x), r1=110(y), r2=101(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 110
LDI r2, 101
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
