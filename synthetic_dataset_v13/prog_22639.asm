; DESCRIPTION: Renders a magenta box of size 115x99 starting at (212, 27).
; PLAN: r0=212(x), r1=27(y), r2=115(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 27
LDI r2, 115
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
