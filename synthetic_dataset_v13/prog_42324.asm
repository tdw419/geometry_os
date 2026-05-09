; DESCRIPTION: Renders a magenta box of size 65x84 starting at (205, 19).
; PLAN: r0=205(x), r1=19(y), r2=65(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 19
LDI r2, 65
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
