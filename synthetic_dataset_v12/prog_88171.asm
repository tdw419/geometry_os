; DESCRIPTION: Renders a magenta box of size 117x36 starting at (234, 17).
; PLAN: r0=234(x), r1=17(y), r2=117(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 17
LDI r2, 117
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
