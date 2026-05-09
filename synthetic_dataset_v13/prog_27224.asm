; DESCRIPTION: Renders a magenta box of size 110x48 starting at (17, 205).
; PLAN: r0=17(x), r1=205(y), r2=110(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 205
LDI r2, 110
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
