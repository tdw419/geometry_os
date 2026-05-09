; DESCRIPTION: Renders a magenta box of size 13x77 starting at (265, 129).
; PLAN: r0=265(x), r1=129(y), r2=13(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 129
LDI r2, 13
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
