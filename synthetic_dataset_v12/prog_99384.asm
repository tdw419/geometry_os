; DESCRIPTION: Renders a magenta box of size 118x17 starting at (386, 144).
; PLAN: r0=386(x), r1=144(y), r2=118(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 144
LDI r2, 118
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
