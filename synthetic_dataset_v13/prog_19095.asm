; DESCRIPTION: Renders a magenta box of size 103x49 starting at (73, 122).
; PLAN: r0=73(x), r1=122(y), r2=103(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 122
LDI r2, 103
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
