; DESCRIPTION: Renders a magenta box of size 54x118 starting at (337, 103).
; PLAN: r0=337(x), r1=103(y), r2=54(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 103
LDI r2, 54
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
