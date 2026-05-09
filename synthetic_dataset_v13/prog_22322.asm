; DESCRIPTION: Renders a magenta box of size 102x36 starting at (31, 63).
; PLAN: r0=31(x), r1=63(y), r2=102(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 63
LDI r2, 102
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
