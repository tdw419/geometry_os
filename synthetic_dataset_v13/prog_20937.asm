; DESCRIPTION: Renders a magenta box of size 77x46 starting at (40, 191).
; PLAN: r0=40(x), r1=191(y), r2=77(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 191
LDI r2, 77
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
