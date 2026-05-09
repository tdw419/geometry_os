; DESCRIPTION: Renders a magenta box of size 20x17 starting at (288, 134).
; PLAN: r0=288(x), r1=134(y), r2=20(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 134
LDI r2, 20
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
