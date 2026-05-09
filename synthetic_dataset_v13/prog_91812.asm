; DESCRIPTION: Renders a magenta box of size 117x46 starting at (163, 156).
; PLAN: r0=163(x), r1=156(y), r2=117(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 156
LDI r2, 117
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
