; DESCRIPTION: Renders a magenta box of size 34x98 starting at (340, 155).
; PLAN: r0=340(x), r1=155(y), r2=34(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 155
LDI r2, 34
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
