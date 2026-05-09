; DESCRIPTION: Renders a magenta box of size 108x23 starting at (350, 121).
; PLAN: r0=350(x), r1=121(y), r2=108(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 121
LDI r2, 108
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
