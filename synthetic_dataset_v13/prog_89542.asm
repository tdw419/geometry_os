; DESCRIPTION: Renders a magenta box of size 84x50 starting at (238, 183).
; PLAN: r0=238(x), r1=183(y), r2=84(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 183
LDI r2, 84
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
