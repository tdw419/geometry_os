; DESCRIPTION: Renders a magenta box of size 35x90 starting at (306, 52).
; PLAN: r0=306(x), r1=52(y), r2=35(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 52
LDI r2, 35
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
