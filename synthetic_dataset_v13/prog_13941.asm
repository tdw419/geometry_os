; DESCRIPTION: Renders a magenta box of size 16x105 starting at (205, 99).
; PLAN: r0=205(x), r1=99(y), r2=16(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 99
LDI r2, 16
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
