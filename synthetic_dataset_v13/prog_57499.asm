; DESCRIPTION: Renders a magenta box of size 52x54 starting at (166, 35).
; PLAN: r0=166(x), r1=35(y), r2=52(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 35
LDI r2, 52
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
