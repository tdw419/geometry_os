; DESCRIPTION: Renders a magenta box of size 120x119 starting at (285, 39).
; PLAN: r0=285(x), r1=39(y), r2=120(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 39
LDI r2, 120
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
