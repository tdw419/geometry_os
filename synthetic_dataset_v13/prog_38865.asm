; DESCRIPTION: Renders a magenta box of size 52x30 starting at (90, 44).
; PLAN: r0=90(x), r1=44(y), r2=52(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 44
LDI r2, 52
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
