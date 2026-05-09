; DESCRIPTION: Renders a magenta box of size 110x36 starting at (349, 98).
; PLAN: r0=349(x), r1=98(y), r2=110(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 98
LDI r2, 110
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
