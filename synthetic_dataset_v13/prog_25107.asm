; DESCRIPTION: Renders a magenta box of size 62x59 starting at (342, 39).
; PLAN: r0=342(x), r1=39(y), r2=62(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 39
LDI r2, 62
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
