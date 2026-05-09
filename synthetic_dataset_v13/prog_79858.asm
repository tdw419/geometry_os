; DESCRIPTION: Renders a magenta box of size 75x91 starting at (261, 129).
; PLAN: r0=261(x), r1=129(y), r2=75(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 129
LDI r2, 75
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
