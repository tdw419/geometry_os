; DESCRIPTION: Renders a magenta box of size 118x39 starting at (207, 141).
; PLAN: r0=207(x), r1=141(y), r2=118(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 141
LDI r2, 118
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
