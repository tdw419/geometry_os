; DESCRIPTION: Renders a magenta box of size 29x61 starting at (9, 80).
; PLAN: r0=9(x), r1=80(y), r2=29(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 80
LDI r2, 29
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
