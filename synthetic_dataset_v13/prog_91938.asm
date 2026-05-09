; DESCRIPTION: Renders a magenta box of size 37x94 starting at (5, 124).
; PLAN: r0=5(x), r1=124(y), r2=37(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 124
LDI r2, 37
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
