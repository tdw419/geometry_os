; DESCRIPTION: Renders a magenta box of size 17x120 starting at (375, 112).
; PLAN: r0=375(x), r1=112(y), r2=17(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 112
LDI r2, 17
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
