; DESCRIPTION: Renders a magenta box of size 113x73 starting at (192, 63).
; PLAN: r0=192(x), r1=63(y), r2=113(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 63
LDI r2, 113
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
