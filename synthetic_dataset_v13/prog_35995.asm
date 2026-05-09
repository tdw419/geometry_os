; DESCRIPTION: Renders a magenta box of size 58x98 starting at (248, 158).
; PLAN: r0=248(x), r1=158(y), r2=58(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 158
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
