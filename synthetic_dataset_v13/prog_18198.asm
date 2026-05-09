; DESCRIPTION: Renders a magenta box of size 93x14 starting at (101, 85).
; PLAN: r0=101(x), r1=85(y), r2=93(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 85
LDI r2, 93
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
