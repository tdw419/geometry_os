; DESCRIPTION: Renders a magenta box of size 13x31 starting at (270, 60).
; PLAN: r0=270(x), r1=60(y), r2=13(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 60
LDI r2, 13
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
