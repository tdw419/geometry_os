; DESCRIPTION: Renders a magenta box of size 43x12 starting at (264, 172).
; PLAN: r0=264(x), r1=172(y), r2=43(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 172
LDI r2, 43
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
