; DESCRIPTION: Renders a magenta box of size 14x68 starting at (484, 145).
; PLAN: r0=484(x), r1=145(y), r2=14(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 145
LDI r2, 14
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
