; DESCRIPTION: Renders a magenta box of size 52x63 starting at (349, 96).
; PLAN: r0=349(x), r1=96(y), r2=52(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 96
LDI r2, 52
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
