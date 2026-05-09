; DESCRIPTION: Renders a magenta box of size 40x31 starting at (409, 105).
; PLAN: r0=409(x), r1=105(y), r2=40(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 105
LDI r2, 40
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
