; DESCRIPTION: Renders a magenta box of size 112x66 starting at (238, 39).
; PLAN: r0=238(x), r1=39(y), r2=112(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 39
LDI r2, 112
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
