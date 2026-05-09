; DESCRIPTION: Renders a magenta box of size 10x71 starting at (296, 118).
; PLAN: r0=296(x), r1=118(y), r2=10(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 118
LDI r2, 10
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
