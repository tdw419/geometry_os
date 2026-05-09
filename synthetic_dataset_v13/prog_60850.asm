; DESCRIPTION: Renders a magenta box of size 78x59 starting at (35, 106).
; PLAN: r0=35(x), r1=106(y), r2=78(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 106
LDI r2, 78
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
