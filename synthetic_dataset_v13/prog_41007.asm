; DESCRIPTION: Renders a magenta box of size 25x58 starting at (244, 84).
; PLAN: r0=244(x), r1=84(y), r2=25(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 84
LDI r2, 25
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
