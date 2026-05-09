; DESCRIPTION: Renders a magenta box of size 99x43 starting at (109, 35).
; PLAN: r0=109(x), r1=35(y), r2=99(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 35
LDI r2, 99
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
