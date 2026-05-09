; DESCRIPTION: Renders a magenta box of size 120x113 starting at (311, 71).
; PLAN: r0=311(x), r1=71(y), r2=120(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 71
LDI r2, 120
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
