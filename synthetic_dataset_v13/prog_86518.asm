; DESCRIPTION: Renders a magenta box of size 37x12 starting at (23, 240).
; PLAN: r0=23(x), r1=240(y), r2=37(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 240
LDI r2, 37
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
