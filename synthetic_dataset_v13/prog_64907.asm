; DESCRIPTION: Renders a magenta box of size 49x117 starting at (112, 128).
; PLAN: r0=112(x), r1=128(y), r2=49(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 128
LDI r2, 49
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
