; DESCRIPTION: Renders a magenta box of size 85x20 starting at (261, 130).
; PLAN: r0=261(x), r1=130(y), r2=85(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 130
LDI r2, 85
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
