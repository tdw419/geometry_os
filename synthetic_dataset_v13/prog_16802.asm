; DESCRIPTION: Renders a magenta box of size 112x95 starting at (325, 127).
; PLAN: r0=325(x), r1=127(y), r2=112(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 127
LDI r2, 112
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
