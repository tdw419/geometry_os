; DESCRIPTION: Renders a magenta box of size 114x75 starting at (318, 171).
; PLAN: r0=318(x), r1=171(y), r2=114(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 171
LDI r2, 114
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
