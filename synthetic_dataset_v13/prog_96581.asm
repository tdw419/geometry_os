; DESCRIPTION: Renders a magenta box of size 70x56 starting at (261, 66).
; PLAN: r0=261(x), r1=66(y), r2=70(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 66
LDI r2, 70
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
