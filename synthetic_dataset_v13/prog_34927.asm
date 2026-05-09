; DESCRIPTION: Renders a magenta box of size 69x110 starting at (91, 44).
; PLAN: r0=91(x), r1=44(y), r2=69(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 44
LDI r2, 69
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
