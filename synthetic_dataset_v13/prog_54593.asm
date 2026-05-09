; DESCRIPTION: Renders a magenta box of size 39x40 starting at (285, 123).
; PLAN: r0=285(x), r1=123(y), r2=39(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 123
LDI r2, 39
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
