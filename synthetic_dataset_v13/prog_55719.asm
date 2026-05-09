; DESCRIPTION: Renders a magenta box of size 15x17 starting at (450, 155).
; PLAN: r0=450(x), r1=155(y), r2=15(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 155
LDI r2, 15
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
