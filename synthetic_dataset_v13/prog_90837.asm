; DESCRIPTION: Renders a magenta box of size 59x57 starting at (247, 84).
; PLAN: r0=247(x), r1=84(y), r2=59(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 84
LDI r2, 59
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
