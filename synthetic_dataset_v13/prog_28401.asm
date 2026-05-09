; DESCRIPTION: Renders a magenta box of size 43x78 starting at (271, 40).
; PLAN: r0=271(x), r1=40(y), r2=43(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 40
LDI r2, 43
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
