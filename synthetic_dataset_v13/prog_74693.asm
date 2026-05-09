; DESCRIPTION: Renders a magenta box of size 10x99 starting at (117, 75).
; PLAN: r0=117(x), r1=75(y), r2=10(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 75
LDI r2, 10
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
