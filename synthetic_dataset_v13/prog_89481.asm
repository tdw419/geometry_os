; DESCRIPTION: Renders a magenta box of size 78x11 starting at (59, 26).
; PLAN: r0=59(x), r1=26(y), r2=78(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 26
LDI r2, 78
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
