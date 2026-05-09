; DESCRIPTION: Renders a magenta box of size 89x59 starting at (134, 131).
; PLAN: r0=134(x), r1=131(y), r2=89(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 131
LDI r2, 89
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
