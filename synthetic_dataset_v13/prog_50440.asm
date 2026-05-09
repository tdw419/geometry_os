; DESCRIPTION: Renders a magenta box of size 21x27 starting at (241, 97).
; PLAN: r0=241(x), r1=97(y), r2=21(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 97
LDI r2, 21
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
