; DESCRIPTION: Renders a magenta box of size 61x14 starting at (125, 26).
; PLAN: r0=125(x), r1=26(y), r2=61(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 26
LDI r2, 61
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
