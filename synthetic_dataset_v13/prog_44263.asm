; DESCRIPTION: Renders a magenta box of size 80x88 starting at (385, 125).
; PLAN: r0=385(x), r1=125(y), r2=80(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 125
LDI r2, 80
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
