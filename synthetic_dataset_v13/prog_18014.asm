; DESCRIPTION: Renders a magenta box of size 45x27 starting at (147, 188).
; PLAN: r0=147(x), r1=188(y), r2=45(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 188
LDI r2, 45
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
