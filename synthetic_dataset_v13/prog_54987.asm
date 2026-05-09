; DESCRIPTION: Renders a magenta box of size 22x108 starting at (0, 131).
; PLAN: r0=0(x), r1=131(y), r2=22(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 131
LDI r2, 22
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
