; DESCRIPTION: Renders a magenta box of size 102x35 starting at (399, 40).
; PLAN: r0=399(x), r1=40(y), r2=102(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 40
LDI r2, 102
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
