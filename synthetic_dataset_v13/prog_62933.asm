; DESCRIPTION: Renders a magenta box of size 90x52 starting at (300, 25).
; PLAN: r0=300(x), r1=25(y), r2=90(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 25
LDI r2, 90
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
