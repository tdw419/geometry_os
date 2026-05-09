; DESCRIPTION: Renders a magenta box of size 72x52 starting at (319, 63).
; PLAN: r0=319(x), r1=63(y), r2=72(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 63
LDI r2, 72
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
