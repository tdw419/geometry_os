; DESCRIPTION: Renders a magenta box of size 30x99 starting at (207, 9).
; PLAN: r0=207(x), r1=9(y), r2=30(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 9
LDI r2, 30
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
