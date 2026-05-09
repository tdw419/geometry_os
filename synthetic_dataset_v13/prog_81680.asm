; DESCRIPTION: Renders a magenta box of size 69x13 starting at (315, 60).
; PLAN: r0=315(x), r1=60(y), r2=69(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 60
LDI r2, 69
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
