; DESCRIPTION: Renders a magenta box of size 118x73 starting at (11, 60).
; PLAN: r0=11(x), r1=60(y), r2=118(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 60
LDI r2, 118
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
