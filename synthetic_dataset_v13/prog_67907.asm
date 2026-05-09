; DESCRIPTION: Renders a magenta box of size 27x40 starting at (147, 104).
; PLAN: r0=147(x), r1=104(y), r2=27(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 104
LDI r2, 27
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
