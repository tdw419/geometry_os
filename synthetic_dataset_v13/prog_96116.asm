; DESCRIPTION: Renders a magenta box of size 100x14 starting at (409, 166).
; PLAN: r0=409(x), r1=166(y), r2=100(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 166
LDI r2, 100
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
