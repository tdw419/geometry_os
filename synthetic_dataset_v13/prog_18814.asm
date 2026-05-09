; DESCRIPTION: Renders a magenta box of size 99x117 starting at (25, 26).
; PLAN: r0=25(x), r1=26(y), r2=99(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 26
LDI r2, 99
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
