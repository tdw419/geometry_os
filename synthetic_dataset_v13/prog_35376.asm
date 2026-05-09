; DESCRIPTION: Renders a magenta box of size 56x27 starting at (359, 7).
; PLAN: r0=359(x), r1=7(y), r2=56(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 7
LDI r2, 56
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
