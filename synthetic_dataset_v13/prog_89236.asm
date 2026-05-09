; DESCRIPTION: Renders a magenta box of size 117x94 starting at (192, 7).
; PLAN: r0=192(x), r1=7(y), r2=117(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 7
LDI r2, 117
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
